import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';

class SellJewelryCard extends StatelessWidget {
  final SellJewelryEntity jewelry;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const SellJewelryCard({
    super.key,
    required this.jewelry,
    this.onIncrement,
    this.onDecrement,
    this.onEdit,
    this.onDelete,
  });

  String _formatPrice(double price) {
    return '${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: MarginApp.m12),
      padding: const EdgeInsets.all(PaddingApp.p12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          const SizedBox(width: SizeApp.s12),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      child: jewelry.imageUrl != null
          ? CachedNetworkImage(
              imageUrl: jewelry.imageUrl!,
              width: SizeApp.s100,
              height: SizeApp.s100,
              fit: BoxFit.cover,
              placeholder: (context, url) => _buildImagePlaceholder(),
              errorWidget: (context, url, error) => _buildImagePlaceholder(),
            )
          : _buildImagePlaceholder(),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: SizeApp.s100,
      height: SizeApp.s100,
      color: AppColors.bgLightGray,
      child: Icon(
        Icons.diamond_outlined,
        color: AppColors.textGray,
        size: SizeApp.s32,
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
        const SizedBox(height: SizeApp.s8),
        _buildQuantitySelector(),
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
        const SizedBox(width: SizeApp.s4),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (onEdit != null)
          GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: const EdgeInsets.all(PaddingApp.p6),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
              ),
              child: Icon(
                Icons.edit_outlined,
                size: SizeApp.s16,
                color: Colors.blue,
              ),
            ),
          ),
        if (onEdit != null && onDelete != null)
          const SizedBox(width: SizeApp.s4),
        if (onDelete != null)
          GestureDetector(
            onTap: onDelete,
            child: Container(
              padding: const EdgeInsets.all(PaddingApp.p6),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
              ),
              child: Icon(
                Icons.delete_outline,
                size: SizeApp.s16,
                color: Colors.red,
              ),
            ),
          ),
        const SizedBox(width: SizeApp.s4),
        _buildSyncBadge(),
      ],
    );
  }

  Widget _buildSyncBadge() {
    final isSynced = jewelry.isSynced;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingApp.p8,
        vertical: PaddingApp.p4,
      ),
      decoration: BoxDecoration(
        color: isSynced ? Colors.green.shade50 : Colors.orange.shade50,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSynced ? Icons.check_circle_outline : Icons.wifi_off_outlined,
            size: SizeApp.s14,
            color: isSynced ? Colors.green : Colors.orange,
          ),
          const SizedBox(width: SizeApp.s4),
          Text(
            isSynced ? AppStrings.synced : AppStrings.offline,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s12,
              color: isSynced ? Colors.green : Colors.orange,
            ),
          ),
        ],
      ),
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
      _formatPrice(jewelry.price),
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
          width: SizeApp.s40,
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
        width: SizeApp.s36,
        height: SizeApp.s36,
        decoration: BoxDecoration(
          color: isPrimary
              ? (isEnabled ? AppColors.primary : AppColors.bgLightGray)
              : AppColors.bgLightGray,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
        ),
        child: Icon(
          icon,
          size: SizeApp.s20,
          color: isPrimary
              ? (isEnabled ? Colors.white : AppColors.textGray)
              : (isEnabled ? AppColors.textBlack : AppColors.textGray),
        ),
      ),
    );
  }
}
