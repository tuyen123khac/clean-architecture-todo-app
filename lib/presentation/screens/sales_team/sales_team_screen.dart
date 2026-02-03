import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/resource/strings/app_strings.dart';
import 'package:todo_app/data/di/service_locator.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';
import '../../custom_widgets/app_bar/custom_app_bar.dart';
import '../../navigation/app_navigation.dart';
import 'bloc/sales_team_bloc.dart';
import 'bloc/sales_team_bloc_selector.dart';
import 'bloc/sales_team_state.dart';
import 'widgets/sales_person_card.dart';
import 'widgets/sales_team_filter_bottom_sheet.dart';

class SalesTeamScreen extends StatefulWidget {
  const SalesTeamScreen({super.key});

  @override
  State<SalesTeamScreen> createState() => _SalesTeamScreenState();
}

class _SalesTeamScreenState extends State<SalesTeamScreen> {
  final SalesTeamBloc _bloc = serviceLocator.get<SalesTeamBloc>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _bloc.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _bloc.close();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _bloc.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        appBar: _buildAppBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildHeader(), _buildBody()],
          ),
        ),
      ),
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      backgroundColor: AppColors.bgWhite,
      centerTitle: true,
      marginLeftIcon: MarginApp.m8,
      leadingWidget: Icon(
        Icons.arrow_back_ios,
        color: AppColors.textBlack,
        size: SizeApp.s20,
      ),
      titleWidget: Text(
        AppStrings.salesTeam,
        style: AppTextStyles.bold(
          fontSize: AppFontSize.s32,
          color: AppColors.textBlack,
        ),
      ),
      onPressLeftIcon: () => AppNavigation.back(context),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ScreenPaddingApp.horizontal,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildConsultantsInfo(), _buildFilterButton()],
      ),
    );
  }

  Widget _buildConsultantsInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.expertJewelryConsultants,
          style: AppTextStyles.bold(
            fontSize: AppFontSize.s16,
            color: AppColors.textDarkGray,
          ),
        ),
        const SizedBox(height: SizeApp.s4),
        SalesTeamTotalSelector(
          builder: (total) => Text(
            AppStrings.consultantsAvailable(total),
            style: AppTextStyles.regular(
              fontSize: AppFontSize.s14,
              color: AppColors.textGray,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton() {
    return SizedBox(
      width: SizeApp.s48,
      height: SizeApp.s48,
      child: IconButton(
        onPressed: _showFilterBottomSheet,
        icon: Icon(Icons.tune, color: AppColors.primary, size: SizeApp.s24),
      ),
    );
  }

  void _showFilterBottomSheet() {
    SalesTeamFilterBottomSheet.show(
      context,
      initialFilter: _bloc.state.filterState,
      onApply: (filterState) {
        _bloc.applyFilters(filterState);
      },
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
            case SalesTeamScreenStatus.loadingMore:
            case SalesTeamScreenStatus.loadMoreFailed:
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
    return SalesTeamErrorSelector(
      builder: (errorMessage) => Center(
        child: Padding(
          padding: const EdgeInsets.all(PaddingApp.p24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: SizeApp.s64,
                color: AppColors.textGray,
              ),
              const SizedBox(height: SizeApp.s16),
              Text(
                errorMessage ?? AppStrings.somethingWentWrong,
                style: AppTextStyles.medium(
                  fontSize: AppFontSize.s16,
                  color: AppColors.textDarkGray,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SizeApp.s24),
              ElevatedButton.icon(
                onPressed: () => _bloc.retry(),
                icon: const Icon(Icons.refresh),
                label: Text(AppStrings.retry),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: PaddingApp.p24,
                    vertical: PaddingApp.p12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSalesTeamListView() {
    return SalesTeamListSelector(
      builder: (salesTeam) => ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(
          horizontal: ScreenPaddingApp.horizontal,
          vertical: PaddingApp.p16,
        ),
        itemCount: salesTeam.length + 1,
        itemBuilder: (context, index) {
          if (index == salesTeam.length) {
            return _buildLoadMoreIndicator();
          }
          return SalesPersonCard(
            key: ValueKey(salesTeam[index].id),
            salesPerson: salesTeam[index],
            onCallPressed: () => _callPhone(salesTeam[index].phone),
          );
        },
      ),
    );
  }

  Widget _buildLoadMoreIndicator() {
    return SalesTeamPaginationSelector(
      builder: (hasMore, isLoadingMore, loadMoreFailed, errorLoadMore) {
        if (isLoadingMore) {
          return const Padding(
            padding: EdgeInsets.all(PaddingApp.p16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (loadMoreFailed) {
          return Padding(
            padding: const EdgeInsets.all(PaddingApp.p16),
            child: Column(
              children: [
                Text(
                  errorLoadMore ?? AppStrings.failedToLoadMore,
                  style: AppTextStyles.regular(
                    fontSize: AppFontSize.s14,
                    color: AppColors.textGray,
                  ),
                ),
                const SizedBox(height: SizeApp.s8),
                TextButton.icon(
                  onPressed: () => _bloc.retryLoadMore(),
                  icon: const Icon(Icons.refresh, size: SizeApp.s16),
                  label: Text(AppStrings.retry),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                  ),
                ),
              ],
            ),
          );
        }
        if (!hasMore) {
          return Padding(
            padding: const EdgeInsets.all(PaddingApp.p16),
            child: Center(
              child: Text(
                AppStrings.noMoreData,
                style: AppTextStyles.regular(
                  fontSize: AppFontSize.s14,
                  color: AppColors.textGray,
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
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
