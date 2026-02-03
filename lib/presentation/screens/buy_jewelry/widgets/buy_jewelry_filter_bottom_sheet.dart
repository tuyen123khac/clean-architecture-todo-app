import 'package:flutter/material.dart';
import 'package:todo_app/presentation/navigation/app_navigation.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../domain/entities/buy_jewelry/jewelry_category_enum_entity.dart';

enum PriceRange { all, under10m, from10mTo30m, from30mTo50m, above50m }

class BuyJewelryFilterState {
  final bool showFavoritesOnly;
  final PriceRange priceRange;
  /// null means "All Categories"
  final JewelryCategoryEnumEntity? category;

  const BuyJewelryFilterState({
    this.showFavoritesOnly = false,
    this.priceRange = PriceRange.all,
    this.category,
  });

  BuyJewelryFilterState copyWith({
    bool? showFavoritesOnly,
    PriceRange? priceRange,
    JewelryCategoryEnumEntity? Function()? category,
  }) {
    return BuyJewelryFilterState(
      showFavoritesOnly: showFavoritesOnly ?? this.showFavoritesOnly,
      priceRange: priceRange ?? this.priceRange,
      category: category != null ? category() : this.category,
    );
  }
}

class BuyJewelryFilterBottomSheet extends StatefulWidget {
  final BuyJewelryFilterState initialFilter;
  final Function(BuyJewelryFilterState) onApply;

  const BuyJewelryFilterBottomSheet({
    super.key,
    required this.initialFilter,
    required this.onApply,
  });

  static Future<void> show(
    BuildContext context, {
    required BuyJewelryFilterState initialFilter,
    required Function(BuyJewelryFilterState) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BuyJewelryFilterBottomSheet(
        initialFilter: initialFilter,
        onApply: onApply,
      ),
    );
  }

  @override
  State<BuyJewelryFilterBottomSheet> createState() =>
      _BuyJewelryFilterBottomSheetState();
}

class _BuyJewelryFilterBottomSheetState extends State<BuyJewelryFilterBottomSheet> {
  late BuyJewelryFilterState _filterState;

  @override
  void initState() {
    super.initState();
    _filterState = widget.initialFilter;
  }

  void _resetFilters() {
    setState(() {
      _filterState = const BuyJewelryFilterState();
    });
  }

  void _applyFilters() {
    widget.onApply(_filterState);
    AppNavigation.pop(context);
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
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: ScreenPaddingApp.horizontal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: SizeApp.s24),
                  _buildShowFavoritesSection(),
                  const SizedBox(height: SizeApp.s24),
                  _buildPriceRangeSection(),
                  const SizedBox(height: SizeApp.s24),
                  _buildCategorySection(),
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ScreenPaddingApp.horizontal,
      ),
      child: Row(
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
      ),
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
            _buildCategoryChip(AppStrings.allCategories, null),
            ...JewelryCategoryEnumEntity.values.map(
              (category) => _buildCategoryChip(category.fullName, category),
            ),
          ],
        ),
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

  Widget _buildCategoryChip(String label, JewelryCategoryEnumEntity? category) {
    final isSelected = _filterState.category == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          _filterState = _filterState.copyWith(category: () => category);
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
