import 'package:flutter/cupertino.dart';
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
import 'bloc/buy_jewelry_bloc.dart';
import 'bloc/buy_jewelry_bloc_selector.dart';
import 'bloc/buy_jewelry_state.dart';
import 'widgets/jewelry_card.dart';
import 'widgets/jewelry_filter_bottom_sheet.dart';

class BuyJewelryScreen extends StatefulWidget {
  const BuyJewelryScreen({super.key});

  @override
  State<BuyJewelryScreen> createState() => _BuyJewelryScreenState();
}

class _BuyJewelryScreenState extends State<BuyJewelryScreen> {
  final BuyJewelryBloc _bloc = serviceLocator.get<BuyJewelryBloc>();

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
        appBar: _buildAppBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildBody(),
            ],
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
        AppStrings.jewelry,
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
      child: Column(
        children: [
          _buildTabSelector(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuyJewelryListSelector(
                builder: (jewelryList) => Text(
                  AppStrings.itemsAvailable(jewelryList.length),
                  style: AppTextStyles.regular(
                    fontSize: AppFontSize.s14,
                    color: AppColors.textDarkGray,
                  ),
                ),
              ),
              _buildFilterButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabSelector() {
    return BuyJewelryTabSelector(
      builder: (selectedTab, wishlistCount) => SizedBox(
        width: double.infinity,
        child: CupertinoSlidingSegmentedControl<JewelryTab>(
          groupValue: selectedTab,
          backgroundColor: AppColors.bgLightGray,
          thumbColor: AppColors.primary,
          padding: const EdgeInsets.all(PaddingApp.p4),
          children: {
            JewelryTab.allItems: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingApp.p16,
                vertical: PaddingApp.p10,
              ),
              child: Text(
                AppStrings.allItems,
                style: AppTextStyles.medium(
                  fontSize: AppFontSize.s14,
                  color: selectedTab == JewelryTab.allItems
                      ? Colors.white
                      : AppColors.textDarkGray,
                ),
              ),
            ),
            JewelryTab.wishlist: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingApp.p16,
                vertical: PaddingApp.p10,
              ),
              child: Text(
                '${AppStrings.wishlist} ($wishlistCount)',
                style: AppTextStyles.medium(
                  fontSize: AppFontSize.s14,
                  color: selectedTab == JewelryTab.wishlist
                      ? Colors.white
                      : AppColors.textDarkGray,
                ),
              ),
            ),
          },
          onValueChanged: (tab) {
            if (tab != null) {
              _bloc.selectTab(tab);
            }
          },
        ),
      ),
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
    JewelryFilterBottomSheet.show(
      context,
      initialFilter: _bloc.state.filterState,
      onApply: (filterState) {
        _bloc.applyFilters(filterState);
      },
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: BuyJewelryStatusSelector(
        builder: (status) {
          switch (status) {
            case BuyJewelryScreenStatus.loading:
              return _buildLoadingView();
            case BuyJewelryScreenStatus.success:
              return _buildJewelryListView();
            case BuyJewelryScreenStatus.error:
              return _buildErrorView();
            default:
              return _buildJewelryListView();
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

  Widget _buildJewelryListView() {
    return BuyJewelryListSelector(
      builder: (jewelryList) => ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: ScreenPaddingApp.horizontal,
        ),
        itemCount: jewelryList.length,
        itemBuilder: (context, index) {
          return JewelryCard(
            jewelry: jewelryList[index],
            onFavoritePressed: () => _bloc.toggleFavorite(index),
            onViewPressed: () => _viewJewelryDetail(jewelryList[index].name),
          );
        },
      ),
    );
  }

  void _viewJewelryDetail(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing $name'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
