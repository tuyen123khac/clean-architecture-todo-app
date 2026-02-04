import 'package:flutter/material.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/value_manager.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double iconSize;

  const CircularIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.size = SizeApp.s44,
    this.iconSize = SizeApp.s20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.bgLightGray,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor ?? AppColors.textBlack,
          size: iconSize,
        ),
      ),
    );
  }
}
