import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../fonts/app_font.dart';

class AppTextStyles {
  static TextStyle light({
    double fontSize = AppFontSize.s14,
    Color? color,
    String fontFamily = AppFontFamily.fontFamilyOpenSans,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: AppFontWeight.light,
      color: color ?? AppColors.textBlack,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }

  static TextStyle regular({
    double fontSize = AppFontSize.s16,
    Color? color,
    String fontFamily = AppFontFamily.fontFamilyOpenSans,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: AppFontWeight.regular,
      color: color ?? AppColors.textBlack,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }

  static TextStyle medium({
    double fontSize = AppFontSize.s16,
    Color? color,
    String fontFamily = AppFontFamily.fontFamilyOpenSans,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: AppFontWeight.medium,
      color: color ?? AppColors.textBlack,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }

  static TextStyle semiBold({
    double fontSize = AppFontSize.s18,
    Color? color,
    String fontFamily = AppFontFamily.fontFamilyOpenSans,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: AppFontWeight.semibold,
      color: color ?? AppColors.textBlack,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }

  static TextStyle bold({
    double fontSize = AppFontSize.s18,
    Color? color,
    String fontFamily = AppFontFamily.fontFamilyOpenSans,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: AppFontWeight.bold,
      color: color ?? AppColors.textBlack,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }
}
