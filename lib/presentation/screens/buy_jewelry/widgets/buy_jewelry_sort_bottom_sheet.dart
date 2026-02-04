import 'package:flutter/material.dart';
import 'package:todo_app/presentation/navigation/app_navigation.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';

enum SortBy { nameAZ, priceLowToHigh, priceHighToLow }

class BuyJewelrySortBottomSheet extends StatefulWidget {
  final SortBy initialSortBy;
  final Function(SortBy) onApply;

  const BuyJewelrySortBottomSheet({
    super.key,
    required this.initialSortBy,
    required this.onApply,
  });

  static Future<void> show(
    BuildContext context, {
    required SortBy initialSortBy,
    required Function(SortBy) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => BuyJewelrySortBottomSheet(
        initialSortBy: initialSortBy,
        onApply: onApply,
      ),
    );
  }

  @override
  State<BuyJewelrySortBottomSheet> createState() => _BuyJewelrySortBottomSheetState();
}

class _BuyJewelrySortBottomSheetState extends State<BuyJewelrySortBottomSheet> {
  late SortBy _selectedSortBy;

  @override
  void initState() {
    super.initState();
    _selectedSortBy = widget.initialSortBy;
  }

  void _onSortSelected(SortBy sortBy) {
    setState(() {
      _selectedSortBy = sortBy;
    });
    widget.onApply(sortBy);
    AppNavigation.pop(context);
  }

  // ==================== Build ====================
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDragHandle(),
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ScreenPaddingApp.horizontal,
            ),
            child: Column(
              children: [
                const SizedBox(height: SizeApp.s16),
                _buildSortItem(AppStrings.priceHighToLow, SortBy.priceHighToLow),
                const SizedBox(height: SizeApp.s12),
                _buildSortItem(AppStrings.priceLowToHigh, SortBy.priceLowToHigh),
                const SizedBox(height: SizeApp.s12),
                _buildSortItem(AppStrings.nameAZ, SortBy.nameAZ),
                const SizedBox(height: SizeApp.s24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== Drag Handle ====================
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

  // ==================== Header ====================
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
                AppStrings.sortBy,
                style: AppTextStyles.bold(
                  fontSize: AppFontSize.s24,
                  color: AppColors.textBlack,
                ),
              ),
              const SizedBox(height: SizeApp.s4),
              Text(
                AppStrings.chooseHowToSort,
                style: AppTextStyles.regular(
                  fontSize: AppFontSize.s14,
                  color: AppColors.textDarkGray,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () => AppNavigation.pop(context),
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

  // ==================== Sort Items ====================
  Widget _buildSortItem(String label, SortBy sortBy) {
    final isSelected = _selectedSortBy == sortBy;
    return GestureDetector(
      onTap: () => _onSortSelected(sortBy),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p16,
          vertical: PaddingApp.p16,
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
                fontSize: AppFontSize.s16,
                color: isSelected ? AppColors.textWhite : AppColors.textDarkGray,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check,
                color: AppColors.textWhite,
                size: SizeApp.s20,
              ),
          ],
        ),
      ),
    );
  }
}
