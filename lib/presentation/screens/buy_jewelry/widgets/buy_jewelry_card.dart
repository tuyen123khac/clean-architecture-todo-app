import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../application/util/number_utils.dart';
import '../../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';

class BuyJewelryCard extends StatefulWidget {
  final BuyJewelryEntity jewelry;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onViewPressed;

  const BuyJewelryCard({
    super.key,
    required this.jewelry,
    this.onFavoritePressed,
    this.onViewPressed,
  });

  @override
  State<BuyJewelryCard> createState() => _BuyJewelryCardState();
}

class _BuyJewelryCardState extends State<BuyJewelryCard> {
  /// Temporary optimistic state, null means use widget.jewelry.isFavorite
  bool? _optimisticFavorite;

  /// Display value: optimistic state if set, otherwise real data from widget
  bool get _displayFavorite => _optimisticFavorite ?? widget.jewelry.isFavorite;

  @override
  void didUpdateWidget(covariant BuyJewelryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Clear optimistic state when real data arrives from bloc
    // This handles: item removed, item's favorite changed, or different item assigned
    if (oldWidget.jewelry.id != widget.jewelry.id ||
        oldWidget.jewelry.isFavorite != widget.jewelry.isFavorite) {
      _optimisticFavorite = null;
    }
  }

  void _handleFavoritePressed() {
    setState(() {
      _optimisticFavorite = !_displayFavorite;
    });
    widget.onFavoritePressed?.call();
  }

  // ==================== Build ====================
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: MarginApp.m16),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: OpacityApp.opa10),
            blurRadius: BlurRadiusApp.b10,
            offset: OffsetApp.o04,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onViewPressed,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
          child: Padding(
            padding: const EdgeInsets.all(PaddingApp.p12),
            child: Row(
              children: [
                _buildProductImage(),
                const SizedBox(width: SizeApp.s12),
                _buildProductInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==================== Product Image ====================

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      child: Image.network(
        '${widget.jewelry.imageUrl}?w=300&h=300&fit=crop',
        width: SizeApp.s120,
        height: SizeApp.s120,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: SizeApp.s120,
            height: SizeApp.s120,
            color: AppColors.bgLightGray,
            child: Icon(
              Icons.diamond_outlined,
              size: SizeApp.s40,
              color: AppColors.textGray,
            ),
          );
        },
      ),
    );
  }

  // ==================== Product Info ====================
  Widget _buildProductInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.jewelry.name,
            style: AppTextStyles.semiBold(
              fontSize: AppFontSize.s16,
              color: AppColors.textBlack,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: SizeApp.s6),
          _buildCategory(),
          const SizedBox(height: SizeApp.s12),
          _buildPriceAndAction(),
        ],
      ),
    );
  }

  // ==================== Category Badge ====================
  Widget _buildCategory() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingApp.p8,
        vertical: PaddingApp.p4,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryLight,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r6),
      ),
      child: Text(
        widget.jewelry.category.fullName,
        style: AppTextStyles.medium(
          fontSize: AppFontSize.s12,
          color: AppColors.primary,
        ),
      ),
    );
  }

  // ==================== Price & Action ====================
  Widget _buildPriceAndAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          NumberUtils.formatPrice(widget.jewelry.price),
          style: AppTextStyles.bold(
            fontSize: AppFontSize.s14,
            color: AppColors.primary,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _handleFavoritePressed,
            borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
            child: Padding(
              padding: const EdgeInsets.all(PaddingApp.p8),
              child: Icon(
                _displayFavorite ? Icons.favorite : Icons.favorite_border,
                color: _displayFavorite ? AppColors.error : AppColors.textGray,
                size: SizeApp.s32,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
