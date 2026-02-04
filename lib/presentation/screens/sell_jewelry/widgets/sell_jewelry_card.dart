import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../application/util/number_utils.dart';
import '../../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';

class SellJewelryCard extends StatelessWidget {
  final SellJewelryEntity jewelry;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onEdit;
  final VoidCallback? onTap;
  final bool isSelectionMode;
  final bool isSelected;

  const SellJewelryCard({
    super.key,
    required this.jewelry,
    this.onIncrement,
    this.onDecrement,
    this.onEdit,
    this.onTap,
    this.isSelectionMode = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: MarginApp.m12),
        padding: const EdgeInsets.all(PaddingApp.p12),
        decoration: BoxDecoration(
          color: AppColors.bgWhite,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
          border: isSelected
              ? Border.all(color: AppColors.primary, width: 2)
              : null,
          boxShadow: [
            BoxShadow(
              color: AppColors.bgBlack.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isSelectionMode) ...[
                  _buildCheckbox(),
                  const SizedBox(width: SizeApp.s12),
                ],
                _buildImageWithBadge(),
                const SizedBox(width: SizeApp.s12),
                Expanded(child: _buildContent()),
              ],
            ),
            if (!isSelectionMode) ...[
              const SizedBox(height: SizeApp.s8),
              _buildQuantitySelector(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return Padding(
      padding: const EdgeInsets.only(top: SizeApp.s28),
      child: Container(
        width: SizeApp.s24,
        height: SizeApp.s24,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.bgWhite,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r6),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.textGray,
            width: 2,
          ),
        ),
        child: isSelected
            ? Icon(Icons.check, color: AppColors.textWhite, size: SizeApp.s16)
            : null,
      ),
    );
  }

  Widget _buildImageWithBadge() {
    // Only show badge for unsynced items
    if (jewelry.isSynced) {
      return _buildImage();
    }
    return Stack(
      children: [
        _buildImage(),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _buildPendingSyncBadge(),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      child: jewelry.imageUrl != null
          ? CachedNetworkImage(
              imageUrl: jewelry.imageUrl!,
              width: SizeApp.s80,
              height: SizeApp.s80,
              fit: BoxFit.cover,
              placeholder: (context, url) => _buildImagePlaceholder(),
              errorWidget: (context, url, error) => _buildImagePlaceholder(),
            )
          : _buildImagePlaceholder(),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: SizeApp.s80,
      height: SizeApp.s80,
      color: AppColors.bgLightGray,
      child: Icon(
        Icons.diamond_outlined,
        color: AppColors.textGray,
        size: SizeApp.s28,
      ),
    );
  }

  Widget _buildPendingSyncBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingApp.p6,
        vertical: PaddingApp.p2,
      ),
      decoration: BoxDecoration(
        color: AppColors.warningLight,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(BorderRadiusApp.r12),
          topRight: Radius.circular(BorderRadiusApp.r12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.access_time,
            size: SizeApp.s12,
            color: AppColors.warning,
          ),
          const SizedBox(width: SizeApp.s2),
          Flexible(
            child: Text(
              AppStrings.pendingSync,
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s10,
                color: AppColors.warning,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: SizeApp.s4),
        _buildMaterialAndStock(),
        const SizedBox(height: SizeApp.s4),
        _buildPrice(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            jewelry.name,
            style: AppTextStyles.semiBold(
              fontSize: AppFontSize.s16,
              color: AppColors.textBlack,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (onEdit != null && !isSelectionMode) ...[
          const SizedBox(width: SizeApp.s8),
          GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: const EdgeInsets.all(PaddingApp.p6),
              decoration: BoxDecoration(
                color: AppColors.infoLight,
                borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
              ),
              child: Icon(
                Icons.edit_outlined,
                size: SizeApp.s16,
                color: AppColors.info,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildMaterialAndStock() {
    return Text(
      '${jewelry.material ?? jewelry.category.fullName} • ${AppStrings.stockCount(jewelry.stock)}',
      style: AppTextStyles.regular(
        fontSize: AppFontSize.s14,
        color: AppColors.textGray,
      ),
    );
  }

  Widget _buildPrice() {
    return Text(
      NumberUtils.formatPrice(jewelry.price),
      style: AppTextStyles.bold(
        fontSize: AppFontSize.s18,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        Text(
          AppStrings.quantityToSell,
          style: AppTextStyles.regular(
            fontSize: AppFontSize.s14,
            color: AppColors.textDarkGray,
          ),
        ),
        const Spacer(),
        _buildQuantityButton(
          icon: Icons.remove,
          onTap: jewelry.quantityToSell > 0 ? onDecrement : null,
          isEnabled: jewelry.quantityToSell > 0,
        ),
        Container(
          width: SizeApp.s36,
          alignment: Alignment.center,
          child: Text(
            jewelry.quantityToSell.toString(),
            style: AppTextStyles.semiBold(
              fontSize: AppFontSize.s16,
              color: AppColors.textBlack,
            ),
          ),
        ),
        _buildQuantityButton(
          icon: Icons.add,
          onTap: jewelry.quantityToSell < jewelry.stock ? onIncrement : null,
          isEnabled: jewelry.quantityToSell < jewelry.stock,
          isPrimary: true,
        ),
      ],
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback? onTap,
    required bool isEnabled,
    bool isPrimary = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeApp.s32,
        height: SizeApp.s32,
        decoration: BoxDecoration(
          color: isPrimary
              ? (isEnabled ? AppColors.primary : AppColors.bgLightGray)
              : AppColors.bgLightGray,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
        ),
        child: Icon(
          icon,
          size: SizeApp.s18,
          color: isPrimary
              ? (isEnabled ? AppColors.textWhite : AppColors.textGray)
              : (isEnabled ? AppColors.textBlack : AppColors.textGray),
        ),
      ),
    );
  }
}
