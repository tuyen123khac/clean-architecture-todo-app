import 'package:flutter/material.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/styles/app_text_style.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool hasBorder;
  final double? borderWidth;
  final Color? colorText;
  final Color? borderColor;
  final Color? bgColor;
  final double? fontSizeText;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? paddingButton;
  final bool isLoading;
  final IconData? icon;
  final double? iconSize;
  const CustomOutlinedButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.hasBorder = true,
    this.colorText,
    this.borderWidth,
    this.borderColor,
    this.bgColor,
    this.fontSizeText,
    this.labelStyle,
    this.paddingButton,
    this.isLoading = false,
    this.icon,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        side: !hasBorder
            ? const BorderSide(color: Colors.transparent)
            : BorderSide(
                width: borderWidth ?? (isLoading ? 1 : 2),
                color: borderColor ??
                    (isLoading
                        ? AppColors.bgGray
                        : AppColors.primary),
              ),
        backgroundColor: bgColor ?? AppColors.bgWhite,
        padding: paddingButton,
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
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    color: colorText ?? AppColors.primary,
                    size: iconSize ?? 20,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: labelStyle ??
                      AppTextStyles.bold(
                        color: colorText ?? AppColors.primary,
                        fontSize: fontSizeText ?? 16,
                      ),
                ),
              ],
            ),
    );
  }
}
