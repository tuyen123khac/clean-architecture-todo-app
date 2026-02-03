import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../domain/entities/buy_jewelry/jewelry_entity.dart';

class JewelryCard extends StatelessWidget {
  final JewelryEntity jewelry;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onViewPressed;

  const JewelryCard({
    super.key,
    required this.jewelry,
    this.onFavoritePressed,
    this.onViewPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: MarginApp.m16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: OpacityApp.opa10),
            blurRadius: BlurRadiusApp.b10,
            offset: OffsetApp.o04,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(PaddingApp.p12),
        child: Row(
          children: [
            _buildProductImage(),
            const SizedBox(width: SizeApp.s12),
            Expanded(child: _buildProductInfo()),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
          child: Image.network(
            '${jewelry.imageUrl}?w=300&h=300&fit=crop',
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
        ),
        Positioned(
          top: SizeApp.s8,
          right: SizeApp.s8,
          child: GestureDetector(
            onTap: onFavoritePressed,
            child: Container(
              padding: const EdgeInsets.all(PaddingApp.p4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                jewelry.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: jewelry.isFavorite ? Colors.red : AppColors.textGray,
                size: SizeApp.s18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          jewelry.name,
          style: AppTextStyles.semiBold(
            fontSize: AppFontSize.s16,
            color: AppColors.textBlack,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: SizeApp.s6),
        _buildCategoryAndMaterial(),
        const SizedBox(height: SizeApp.s12),
        _buildPriceAndAction(),
      ],
    );
  }

  Widget _buildCategoryAndMaterial() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingApp.p8,
            vertical: PaddingApp.p4,
          ),
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: BorderRadius.circular(BorderRadiusApp.r6),
          ),
          child: Text(
            jewelry.category.fullName,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s12,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${jewelry.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
          style: AppTextStyles.bold(
            fontSize: AppFontSize.s20,
            color: AppColors.primary,
          ),
        ),
        SizedBox(
          height: SizeApp.s36,
          child: ElevatedButton(
            onPressed: onViewPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p16),
              elevation: ElevationApp.ev0,
            ),
            child: Text(
              AppStrings.view,
              style: AppTextStyles.semiBold(
                fontSize: AppFontSize.s14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
