import 'package:flutter/material.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';

class QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int? minValue;
  final int? maxValue;

  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.minValue,
    this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.bgLightGray),
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            icon: Icons.remove,
            onTap: minValue == null || quantity > minValue! ? onDecrement : null,
          ),
          Container(
            width: SizeApp.s56,
            alignment: Alignment.center,
            child: Text(
              quantity.toString(),
              style: AppTextStyles.semiBold(
                fontSize: AppFontSize.s18,
                color: AppColors.textBlack,
              ),
            ),
          ),
          _buildButton(
            icon: Icons.add,
            onTap: maxValue == null || quantity < maxValue! ? onIncrement : null,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({required IconData icon, VoidCallback? onTap}) {
    final isEnabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeApp.s48,
        height: SizeApp.s48,
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: isEnabled ? AppColors.textBlack : AppColors.textGray,
          size: SizeApp.s20,
        ),
      ),
    );
  }
}
