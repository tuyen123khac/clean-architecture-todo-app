import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/resource/strings/app_strings.dart';
import 'package:todo_app/data/di/service_locator.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';
import '../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../custom_widgets/app_bar/custom_app_bar.dart';
import '../../navigation/app_navigation.dart';
import '../jewelry_detail/jewelry_detail_screen.dart';
import '../../navigation/app_routes.dart';
import 'bloc/buy_jewelry_bloc.dart';
import 'bloc/buy_jewelry_bloc_selector.dart';
import 'bloc/buy_jewelry_state.dart';
import 'widgets/buy_jewelry_card.dart';
import 'widgets/buy_jewelry_filter_bottom_sheet.dart';
import 'widgets/buy_jewelry_sort_bottom_sheet.dart';

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
        body: _buildBody(),
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

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildTabSelector(), _buildTabContent()],
      ),
    );
  }

  Widget _buildTabSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ScreenPaddingApp.horizontal,
      ),
      child: BuyJewelryTabSelector(
        builder: (selectedTab, wishlistCount) => SizedBox(
          width: double.infinity,
          child: CupertinoSlidingSegmentedControl<BuyJewelryTab>(
            groupValue: selectedTab,
            backgroundColor: AppColors.bgLightGray,
            thumbColor: AppColors.primary,
            padding: const EdgeInsets.all(PaddingApp.p4),
            children: {
              BuyJewelryTab.allItems: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingApp.p16,
                  vertical: PaddingApp.p10,
                ),
                child: Text(
                  AppStrings.allItems,
                  style: AppTextStyles.medium(
                    fontSize: AppFontSize.s14,
                    color: selectedTab == BuyJewelryTab.allItems
                        ? Colors.white
                        : AppColors.textDarkGray,
                  ),
                ),
              ),
              BuyJewelryTab.wishlist: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingApp.p16,
                  vertical: PaddingApp.p10,
                ),
                child: Text(
                  '${AppStrings.wishlist} ($wishlistCount)',
                  style: AppTextStyles.medium(
                    fontSize: AppFontSize.s14,
                    color: selectedTab == BuyJewelryTab.wishlist
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
      ),
    );
  }

  Widget _buildTabContent() {
    return Expanded(
      child: BuyJewelryTabSelector(
        builder: (selectedTab, _) => IndexedStack(
          index: selectedTab == BuyJewelryTab.allItems ? 0 : 1,
          children: [_buildAllItemsTab(), _buildWishlistTab()],
        ),
      ),
    );
  }

  Widget _buildAllItemsTab() {
    return Column(children: [_buildFilterSection(), _buildAllItemsBody()]);
  }

  Widget _buildWishlistTab() {
    return BuyJewelryWishlistSelector(
      builder: (wishlist) {
        if (wishlist.isEmpty) {
          return _buildEmptyWishlistView();
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: ScreenPaddingApp.horizontal,
          ),
          itemCount: wishlist.length,
          itemBuilder: (context, index) {
            final jewelry = wishlist[index];
            return BuyJewelryCard(
              key: ValueKey(jewelry.id),
              jewelry: jewelry,
              onFavoritePressed: () =>
                  _bloc.toggleFavoriteInWishlist(jewelry.id),
              onViewPressed: () => _viewJewelryDetail(jewelry),
            );
          },
        );
      },
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ScreenPaddingApp.horizontal,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuyJewelryAllItemsSelector(
            builder: (jewelryList) => Text(
              AppStrings.itemsAvailable(jewelryList.length),
              style: AppTextStyles.regular(
                fontSize: AppFontSize.s14,
                color: AppColors.textDarkGray,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: SizeApp.s48,
                height: SizeApp.s48,
                child: IconButton(
                  onPressed: _showSortBottomSheet,
                  icon: Icon(
                    Icons.swap_vert,
                    color: AppColors.primary,
                    size: SizeApp.s24,
                  ),
                ),
              ),
              SizedBox(
                width: SizeApp.s48,
                height: SizeApp.s48,
                child: IconButton(
                  onPressed: _showFilterBottomSheet,
                  icon: Icon(
                    Icons.tune,
                    color: AppColors.primary,
                    size: SizeApp.s24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWishlistView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: SizeApp.s64,
            color: AppColors.textGray,
          ),
          const SizedBox(height: SizeApp.s16),
          Text(
            'No items in wishlist',
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s16,
              color: AppColors.textDarkGray,
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet() {
    BuyJewelryFilterBottomSheet.show(
      context,
      initialFilter: _bloc.state.filterState,
      onApply: (filterState) {
        _bloc.applyFilters(filterState);
      },
    );
  }

  void _showSortBottomSheet() {
    BuyJewelrySortBottomSheet.show(
      context,
      initialSortBy: _bloc.state.sortBy,
      onApply: (sortBy) {
        _bloc.applySorting(sortBy);
      },
    );
  }

  Widget _buildAllItemsBody() {
    return Expanded(
      child: BuyJewelryStatusSelector(
        builder: (status) {
          switch (status) {
            case BuyJewelryScreenStatus.loading:
              return _buildLoadingView();
            case BuyJewelryScreenStatus.success:
              return _buildAllItemsListView();
            case BuyJewelryScreenStatus.error:
              return _buildErrorView();
            default:
              return _buildAllItemsListView();
          }
        },
      ),
    );
  }

  Widget _buildLoadingView() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorView() {
    return BuyJewelryErrorSelector(
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

  Widget _buildAllItemsListView() {
    return BuyJewelryAllItemsSelector(
      builder: (jewelryList) {
        if (jewelryList.isEmpty) {
          return _buildEmptyAllItemsView();
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: ScreenPaddingApp.horizontal,
          ),
          itemCount: jewelryList.length,
          itemBuilder: (context, index) {
            final jewelry = jewelryList[index];
            return BuyJewelryCard(
              key: ValueKey(jewelry.id),
              jewelry: jewelry,
              onFavoritePressed: () => _bloc.toggleFavorite(index),
              onViewPressed: () => _viewJewelryDetail(jewelry),
            );
          },
        );
      },
    );
  }

  Widget _buildEmptyAllItemsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: SizeApp.s64,
            color: AppColors.textGray,
          ),
          const SizedBox(height: SizeApp.s16),
          Text(
            'No items found',
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s16,
              color: AppColors.textDarkGray,
            ),
          ),
        ],
      ),
    );
  }

  void _viewJewelryDetail(BuyJewelryEntity jewelry) {
    AppNavigation.routeTo(
      context,
      AppRoutes.jewelryDetail,
      args: JewelryDetailArgs(jewelry: jewelry),
    );
  }
}
