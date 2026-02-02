import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/resource/strings/app_strings.dart';
import 'package:todo_app/data/di/service_locator.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';
import 'bloc/sales_team_bloc.dart';
import 'bloc/sales_team_bloc_selector.dart';
import 'bloc/sales_team_state.dart';
import 'widgets/sales_person_card.dart';

class SalesTeamScreen extends StatefulWidget {
  const SalesTeamScreen({super.key});

  @override
  State<SalesTeamScreen> createState() => _SalesTeamScreenState();
}

class _SalesTeamScreenState extends State<SalesTeamScreen> {
  final SalesTeamBloc _bloc = serviceLocator.get<SalesTeamBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildHeader(), _buildBody()],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenPaddingApp.horizontal,
        vertical: PaddingApp.p16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.salesTeam,
            style: AppTextStyles.bold(
              fontSize: AppFontSize.s32,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: SizeApp.s4),
          Text(
            AppStrings.expertJewelryConsultants,
            style: AppTextStyles.regular(
              fontSize: AppFontSize.s14,
              color: AppColors.textDarkGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: SalesTeamStatusSelector(
        builder: (status) {
          switch (status) {
            case SalesTeamScreenStatus.loading:
              return _buildLoadingView();
            case SalesTeamScreenStatus.success:
              return _buildSalesTeamListView();
            case SalesTeamScreenStatus.error:
              return _buildErrorView();
            default:
              return _buildSalesTeamListView();
          }
        },
      ),
    );
  }

  Widget _buildLoadingView() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorView() {
    return const Center(child: Text('Error'));
  }

  Widget _buildSalesTeamListView() {
    return SalesTeamListSelector(
      builder: (salesTeam) => ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: ScreenPaddingApp.horizontal,
        ),
        itemCount: salesTeam.length,
        itemBuilder: (context, index) {
          return SalesPersonCard(
            salesPerson: salesTeam[index],
            onFavoritePressed: () => _bloc.toggleFavorite(index),
            onCallPressed: () => _callPhone(salesTeam[index].phone),
          );
        },
      ),
    );
  }

  void _callPhone(String phone) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Calling $phone'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
