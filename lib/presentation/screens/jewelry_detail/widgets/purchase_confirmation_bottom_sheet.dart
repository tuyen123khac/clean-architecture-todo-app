import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../application/util/number_utils.dart';
import '../../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../../custom_widgets/bottom_sheet/bottom_sheet_container.dart';
import '../../../custom_widgets/button/custom_filled_button.dart';
import '../../../custom_widgets/button/custom_outline_button.dart';
import '../../../custom_widgets/stepper/quantity_stepper.dart';
import '../../../navigation/app_navigation.dart';

class PurchaseConfirmationBottomSheet extends StatefulWidget {
  final BuyJewelryEntity jewelry;
  final Future<bool> Function(int quantity) onPayment;

  const PurchaseConfirmationBottomSheet({
    super.key,
    required this.jewelry,
    required this.onPayment,
  });

  static Future<bool?> show(
    BuildContext context, {
    required BuyJewelryEntity jewelry,
    required Future<bool> Function(int quantity) onPayment,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PurchaseConfirmationBottomSheet(
        jewelry: jewelry,
        onPayment: onPayment,
      ),
    );
  }

  @override
  State<PurchaseConfirmationBottomSheet> createState() =>
      _PurchaseConfirmationBottomSheetState();
}

class _PurchaseConfirmationBottomSheetState
    extends State<PurchaseConfirmationBottomSheet> {
  int _quantity = 1;
  bool _isLoading = false;

  double get _totalCost => widget.jewelry.price * _quantity;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  Future<void> _handlePayment() async {
    setState(() {
      _isLoading = true;
    });

    final success = await widget.onPayment(_quantity);

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      AppNavigation.pop(context, success);
    }
  }

  // ==================== Build ====================
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          _buildProductInfo(),
          _buildQuantitySection(),
          _buildTotalSection(),
          _buildButtons(),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + PaddingApp.p16,
          ),
        ],
      ),
    );
  }

  // ==================== Header ====================
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.confirmPurchase,
            style: AppTextStyles.bold(
              fontSize: AppFontSize.s20,
              color: AppColors.textBlack,
            ),
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

  // ==================== Product Info ====================
  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ScreenPaddingApp.horizontal,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
            child: Image.network(
              '${widget.jewelry.imageUrl}?w=200&h=200&fit=crop',
              width: SizeApp.s80,
              height: SizeApp.s80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: SizeApp.s80,
                height: SizeApp.s80,
                color: AppColors.bgLightGray,
                child: Icon(
                  Icons.diamond_outlined,
                  color: AppColors.textGray,
                  size: SizeApp.s32,
                ),
              ),
            ),
          ),
          const SizedBox(width: SizeApp.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.jewelry.name,
                  style: AppTextStyles.semiBold(
                    fontSize: AppFontSize.s16,
                    color: AppColors.textBlack,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: SizeApp.s4),
                Text(
                  NumberUtils.formatPrice(widget.jewelry.price),
                  style: AppTextStyles.bold(
                    fontSize: AppFontSize.s18,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== Quantity Section ====================
  Widget _buildQuantitySection() {
    return Padding(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.quantity,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s16,
              color: AppColors.textDarkGray,
            ),
          ),
          QuantityStepper(
            quantity: _quantity,
            onIncrement: _incrementQuantity,
            onDecrement: _decrementQuantity,
            minValue: 1,
          ),
        ],
      ),
    );
  }

  // ==================== Total Section ====================
  Widget _buildTotalSection() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: ScreenPaddingApp.horizontal,
      ),
      padding: const EdgeInsets.all(PaddingApp.p16),
      decoration: BoxDecoration(
        color: AppColors.bgLightGray,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.totalCost,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s16,
              color: AppColors.textDarkGray,
            ),
          ),
          Text(
            NumberUtils.formatPrice(_totalCost),
            style: AppTextStyles.bold(
              fontSize: AppFontSize.s20,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  // ==================== Buttons ====================
  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      child: Row(
        children: [
          Expanded(
            child: CustomOutlinedButton(
              label: AppStrings.cancel,
              onPressed: () => AppNavigation.pop(context),
              colorText: AppColors.textDarkGray,
              borderColor: AppColors.bgLightGray,
            ),
          ),
          const SizedBox(width: SizeApp.s12),
          Expanded(
            flex: 2,
            child: CustomFilledButton(
              label: AppStrings.payment,
              onPressed: _isLoading ? null : _handlePayment,
              isLoading: _isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
