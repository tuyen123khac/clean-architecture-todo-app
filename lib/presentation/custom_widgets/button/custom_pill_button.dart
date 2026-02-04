import 'package:flutter/material.dart';

import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';

class CustomPillButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final double fontSize;
  final double iconSize;

  const CustomPillButton({
    super.key,
    required this.label,
    this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
    this.borderColor,
    this.onPressed,
    this.fontSize = AppFontSize.s12,
    this.iconSize = SizeApp.s14,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p12,
          vertical: PaddingApp.p8,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r20),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: foregroundColor, size: iconSize),
              const SizedBox(width: SizeApp.s4),
            ],
            Text(
              label,
              style: AppTextStyles.medium(
                fontSize: fontSize,
                color: foregroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
