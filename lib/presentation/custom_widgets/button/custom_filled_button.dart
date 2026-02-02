import 'package:flutter/material.dart';
import 'package:todo_app/application/resource/value_manager.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/styles/app_text_style.dart';

class CustomFilledButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final Color? color;
  final Color? textColor;
  final Color? textColorDisable;
  final VoidCallback? onPressed;
  final bool isEnable;
  final bool hasShadow;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? paddingButton;
  final IconData? icon;

  const CustomFilledButton({
    super.key,
    required this.label,
    this.isLoading = false,
    this.color,
    this.textColor,
    this.textColorDisable,
    this.onPressed,
    this.isEnable = true,
    this.hasShadow = true,
    this.labelStyle,
    this.paddingButton,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.border,
        backgroundColor: color ?? AppColors.primary,
        padding: paddingButton,
        shadowColor: hasShadow ? AppColors.bgBlackGray : Colors.transparent,
      ),
      child: isLoading
          ? Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(2),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.textWhite,
              ),
            )
          : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? Icon(icon, color: AppColors.textWhite) : const SizedBox.shrink(),
               SizedBox(width: MarginApp.m8),
              Text(
                  label,
                  style:
                      labelStyle ??
                      AppTextStyles.semiBold(
                        fontSize: 16,
                        color: textColor ?? AppColors.textWhite,
                      ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
            ],
          ),
    );
  }
}
