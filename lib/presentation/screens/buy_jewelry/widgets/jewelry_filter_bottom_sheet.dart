import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';

enum PriceRange { all, under10m, from10mTo30m, from30mTo50m, above50m }

enum JewelryCategory { all, sjcGold, gold24K, gold18K, gold14K, whiteGold, gemstone }

enum SortBy { nameAZ, priceLowToHigh, priceHighToLow }

class JewelryFilterState {
  final bool showFavoritesOnly;
  final PriceRange priceRange;
  final JewelryCategory category;
  final SortBy sortBy;

  const JewelryFilterState({
    this.showFavoritesOnly = false,
    this.priceRange = PriceRange.all,
    this.category = JewelryCategory.all,
    this.sortBy = SortBy.nameAZ,
  });

  JewelryFilterState copyWith({
    bool? showFavoritesOnly,
    PriceRange? priceRange,
    JewelryCategory? category,
    SortBy? sortBy,
  }) {
    return JewelryFilterState(
      showFavoritesOnly: showFavoritesOnly ?? this.showFavoritesOnly,
      priceRange: priceRange ?? this.priceRange,
      category: category ?? this.category,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}

class JewelryFilterBottomSheet extends StatefulWidget {
  final JewelryFilterState initialFilter;
  final Function(JewelryFilterState) onApply;

  const JewelryFilterBottomSheet({
    super.key,
    required this.initialFilter,
    required this.onApply,
  });

  static Future<void> show(
    BuildContext context, {
    required JewelryFilterState initialFilter,
    required Function(JewelryFilterState) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => JewelryFilterBottomSheet(
        initialFilter: initialFilter,
        onApply: onApply,
      ),
    );
  }

  @override
  State<JewelryFilterBottomSheet> createState() =>
      _JewelryFilterBottomSheetState();
}

class _JewelryFilterBottomSheetState extends State<JewelryFilterBottomSheet> {
  late JewelryFilterState _filterState;

  @override
  void initState() {
    super.initState();
    _filterState = widget.initialFilter;
  }

  void _resetFilters() {
    setState(() {
      _filterState = const JewelryFilterState();
    });
  }

  void _applyFilters() {
    widget.onApply(_filterState);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildDragHandle(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: ScreenPaddingApp.horizontal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: SizeApp.s24),
                  _buildShowFavoritesSection(),
                  const SizedBox(height: SizeApp.s24),
                  _buildPriceRangeSection(),
                  const SizedBox(height: SizeApp.s24),
                  _buildCategorySection(),
                  const SizedBox(height: SizeApp.s24),
                  _buildSortBySection(),
                  const SizedBox(height: SizeApp.s24),
                ],
              ),
            ),
          ),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildDragHandle() {
    return Container(
      margin: const EdgeInsets.only(top: MarginApp.m12),
      width: SizeApp.s40,
      height: SizeApp.s4,
      decoration: BoxDecoration(
        color: AppColors.bgLightGray,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r2),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: SizeApp.s16),
            Text(
              AppStrings.filters,
              style: AppTextStyles.bold(
                fontSize: AppFontSize.s24,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: SizeApp.s4),
            Text(
              AppStrings.refineYourSearch,
              style: AppTextStyles.regular(
                fontSize: AppFontSize.s14,
                color: AppColors.textDarkGray,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close,
            color: AppColors.textBlack,
            size: SizeApp.s24,
          ),
        ),
      ],
    );
  }

  Widget _buildShowFavoritesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          icon: Icons.favorite_border,
          title: AppStrings.showFavoritesOnly,
        ),
        const SizedBox(height: SizeApp.s12),
        _buildFilterButton(
          label: AppStrings.wishlistedItems,
          icon: Icons.favorite_border,
          isSelected: _filterState.showFavoritesOnly,
          onTap: () {
            setState(() {
              _filterState = _filterState.copyWith(
                showFavoritesOnly: !_filterState.showFavoritesOnly,
              );
            });
          },
        ),
      ],
    );
  }

  Widget _buildPriceRangeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          icon: Icons.attach_money,
          title: AppStrings.priceRange,
        ),
        const SizedBox(height: SizeApp.s12),
        Wrap(
          spacing: SizeApp.s12,
          runSpacing: SizeApp.s12,
          children: [
            _buildPriceChip(AppStrings.allPrices, PriceRange.all),
            _buildPriceChip(AppStrings.under10m, PriceRange.under10m),
            _buildPriceChip(AppStrings.from10mTo30m, PriceRange.from10mTo30m),
            _buildPriceChip(AppStrings.from30mTo50m, PriceRange.from30mTo50m),
            _buildPriceChip(AppStrings.above50m, PriceRange.above50m),
          ],
        ),
      ],
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          icon: Icons.auto_awesome,
          title: AppStrings.category,
        ),
        const SizedBox(height: SizeApp.s12),
        Wrap(
          spacing: SizeApp.s8,
          runSpacing: SizeApp.s8,
          children: [
            _buildCategoryChip(AppStrings.allCategories, JewelryCategory.all),
            _buildCategoryChip(AppStrings.sjcGold, JewelryCategory.sjcGold),
            _buildCategoryChip(AppStrings.gold24K, JewelryCategory.gold24K),
            _buildCategoryChip(AppStrings.gold18K, JewelryCategory.gold18K),
            _buildCategoryChip(AppStrings.gold14K, JewelryCategory.gold14K),
            _buildCategoryChip(AppStrings.whiteGold, JewelryCategory.whiteGold),
            _buildCategoryChip(AppStrings.gemstone, JewelryCategory.gemstone),
          ],
        ),
      ],
    );
  }

  Widget _buildSortBySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          icon: Icons.swap_vert,
          title: AppStrings.sortBy,
        ),
        const SizedBox(height: SizeApp.s12),
        _buildSortItem(AppStrings.nameAZ, SortBy.nameAZ),
        const SizedBox(height: SizeApp.s8),
        _buildSortItem(AppStrings.priceLowToHigh, SortBy.priceLowToHigh),
        const SizedBox(height: SizeApp.s8),
        _buildSortItem(AppStrings.priceHighToLow, SortBy.priceHighToLow),
      ],
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: SizeApp.s20),
        const SizedBox(width: SizeApp.s8),
        Text(
          title,
          style: AppTextStyles.semiBold(
            fontSize: AppFontSize.s16,
            color: AppColors.textBlack,
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p16,
          vertical: PaddingApp.p14,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.bgLightGray,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s14,
                color: isSelected ? Colors.white : AppColors.textDarkGray,
              ),
            ),
            Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.textGray,
              size: SizeApp.s20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceChip(String label, PriceRange range) {
    final isSelected = _filterState.priceRange == range;
    return GestureDetector(
      onTap: () {
        setState(() {
          _filterState = _filterState.copyWith(priceRange: range);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p20,
          vertical: PaddingApp.p14,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.bgLightGray,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r25),
        ),
        child: Text(
          label,
          style: AppTextStyles.medium(
            fontSize: AppFontSize.s14,
            color: isSelected ? Colors.white : AppColors.textDarkGray,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, JewelryCategory category) {
    final isSelected = _filterState.category == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          _filterState = _filterState.copyWith(category: category);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p16,
          vertical: PaddingApp.p12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.bgLightGray,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r20),
        ),
        child: Text(
          label,
          style: AppTextStyles.medium(
            fontSize: AppFontSize.s14,
            color: isSelected ? Colors.white : AppColors.textDarkGray,
          ),
        ),
      ),
    );
  }

  Widget _buildSortItem(String label, SortBy sortBy) {
    final isSelected = _filterState.sortBy == sortBy;
    return GestureDetector(
      onTap: () {
        setState(() {
          _filterState = _filterState.copyWith(sortBy: sortBy);
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p16,
          vertical: PaddingApp.p14,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.textBlack : AppColors.bgLightGray,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s14,
              color: isSelected ? Colors.white : AppColors.textDarkGray,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.bgLightGray, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _resetFilters,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: PaddingApp.p14),
                decoration: BoxDecoration(
                  color: AppColors.bgLightGray,
                  borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
                ),
                child: Center(
                  child: Text(
                    AppStrings.resetAll,
                    style: AppTextStyles.semiBold(
                      fontSize: AppFontSize.s16,
                      color: AppColors.textDarkGray,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: SizeApp.s12),
          Expanded(
            child: GestureDetector(
              onTap: _applyFilters,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: PaddingApp.p14),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
                ),
                child: Center(
                  child: Text(
                    AppStrings.applyFilters,
                    style: AppTextStyles.semiBold(
                      fontSize: AppFontSize.s16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
