import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../application/util/number_utils.dart';
import '../../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';

class SellConfirmationBottomSheet extends StatelessWidget {
  final List<SellJewelryEntity> itemsToSell;
  final double estimatedTotal;
  final Future<bool> Function() onConfirm;

  const SellConfirmationBottomSheet({
    super.key,
    required this.itemsToSell,
    required this.estimatedTotal,
    required this.onConfirm,
  });

  static Future<bool?> show(
    BuildContext context, {
    required List<SellJewelryEntity> itemsToSell,
    required double estimatedTotal,
    required Future<bool> Function() onConfirm,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SellConfirmationBottomSheet(
        itemsToSell: itemsToSell,
        estimatedTotal: estimatedTotal,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalQuantity = itemsToSell.fold<int>(
      0,
      (sum, item) => sum + item.quantityToSell,
    );

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: ScreenPaddingApp.horizontal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: SizeApp.s16),
                  _buildItemsList(),
                  const SizedBox(height: SizeApp.s16),
                  _buildSummary(totalQuantity),
                  const SizedBox(height: SizeApp.s24),
                  _buildButtons(context),
                  const SizedBox(height: SizeApp.s16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.bgLightGray, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.confirmSale,
            style: AppTextStyles.bold(
              fontSize: AppFontSize.s20,
              color: AppColors.textBlack,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(PaddingApp.p8),
              decoration: BoxDecoration(
                color: AppColors.bgLightGray,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                size: SizeApp.s20,
                color: AppColors.textDarkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.itemsToSell(itemsToSell.length),
          style: AppTextStyles.semiBold(
            fontSize: AppFontSize.s16,
            color: AppColors.textBlack,
          ),
        ),
        const SizedBox(height: SizeApp.s12),
        ...itemsToSell.map((item) => _buildItemRow(item)),
      ],
    );
  }

  Widget _buildItemRow(SellJewelryEntity item) {
    return Container(
      margin: const EdgeInsets.only(bottom: MarginApp.m8),
      padding: const EdgeInsets.all(PaddingApp.p12),
      decoration: BoxDecoration(
        color: AppColors.bgLightGray,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      ),
      child: Row(
        children: [
          Container(
            width: SizeApp.s48,
            height: SizeApp.s48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
            ),
            child: item.imageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
                    child: Image.network(
                      item.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.diamond_outlined,
                        color: AppColors.textGray,
                        size: SizeApp.s24,
                      ),
                    ),
                  )
                : Icon(
                    Icons.diamond_outlined,
                    color: AppColors.textGray,
                    size: SizeApp.s24,
                  ),
          ),
          const SizedBox(width: SizeApp.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: AppTextStyles.semiBold(
                    fontSize: AppFontSize.s14,
                    color: AppColors.textBlack,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: SizeApp.s4),
                Text(
                  '${AppStrings.quantity}: ${item.quantityToSell}',
                  style: AppTextStyles.regular(
                    fontSize: AppFontSize.s12,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
          Text(
            NumberUtils.formatPrice(item.price * item.quantityToSell),
            style: AppTextStyles.semiBold(
              fontSize: AppFontSize.s14,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(int totalQuantity) {
    return Container(
      padding: const EdgeInsets.all(PaddingApp.p16),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
        border: Border.all(color: Colors.teal.shade200),
      ),
      child: Column(
        children: [
          _buildSummaryRow(
            AppStrings.totalItems,
            totalQuantity.toString(),
          ),
          const SizedBox(height: SizeApp.s8),
          _buildSummaryRow(
            AppStrings.estimatedRevenue,
            NumberUtils.formatPrice(estimatedTotal),
            isHighlighted: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isHighlighted = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.regular(
            fontSize: AppFontSize.s14,
            color: isHighlighted ? Colors.teal.shade800 : AppColors.textDarkGray,
          ),
        ),
        Text(
          value,
          style: isHighlighted
              ? AppTextStyles.bold(
                  fontSize: AppFontSize.s18,
                  color: Colors.teal.shade800,
                )
              : AppTextStyles.semiBold(
                  fontSize: AppFontSize.s14,
                  color: AppColors.textBlack,
                ),
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: PaddingApp.p14),
              side: BorderSide(color: AppColors.textGray),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
              ),
            ),
            child: Text(
              AppStrings.cancel,
              style: AppTextStyles.semiBold(
                fontSize: AppFontSize.s16,
                color: AppColors.textDarkGray,
              ),
            ),
          ),
        ),
        const SizedBox(width: SizeApp.s12),
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              final result = await onConfirm();
              if (context.mounted) {
                Navigator.of(context).pop(result);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: PaddingApp.p14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
              ),
            ),
            child: Text(
              AppStrings.confirmSell,
              style: AppTextStyles.semiBold(
                fontSize: AppFontSize.s16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
