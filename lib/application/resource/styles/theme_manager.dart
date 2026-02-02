import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/app_colors.dart';
import '../fonts/app_font.dart';
import '../value_manager.dart';
import 'app_text_style.dart';

class ThemeApp {
  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      // main colors
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.textWhite,
        secondary: AppColors.secondary,
        onSecondary: AppColors.textWhite,
        surface: AppColors.bgWhite,
        onSurface: AppColors.textBlack,
        error: AppColors.error,
        onError: AppColors.textWhite,
      ),
      primaryColorLight: AppColors.primary,
      primaryColorDark: AppColors.primary,
      canvasColor: AppColors.secondary,
      disabledColor: AppColors.secondary,
      scaffoldBackgroundColor: AppColors.bgWhite,

      // ripple color
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      //App bar
      appBarTheme: _appBarTheme(),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(),
      pageTransitionsTheme: _pageTransitionsTheme(),
      textButtonTheme: _textButtonThemeData(),
      // Elevated Button
      elevatedButtonTheme: _elevatedButtonThemeData(),
      //Outline Button
      outlinedButtonTheme: _outlinedButtonTheme(),
      filledButtonTheme: _filledButtonTheme(),
      // Text theme
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.textBlack,
        selectionColor: AppColors.textBlack,
        selectionHandleColor: AppColors.textBlack,
      ),
      // input decoration theme (text form field)
      inputDecorationTheme: _inputDecorationTheme(),
      textTheme: _textTheme(),
      timePickerTheme: _timePickerTheme(),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusApp.r16),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.bgWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusApp.r16),
        ),
        titleTextStyle: AppTextStyles.semiBold(
          color: AppColors.textWhite,
          fontSize: AppFontSize.s18,
        ),
      ),
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      centerTitle: true,
      backgroundColor: AppColors.bgWhite,
      elevation: ElevationApp.ev4,
      titleTextStyle: AppTextStyles.bold(
        color: AppColors.primary,
        fontSize: AppFontSize.s26,
      ),
    );
  }

  static BottomNavigationBarThemeData _bottomNavigationBarTheme() {
    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondaryLight,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondaryLight,
      selectedLabelStyle: AppTextStyles.medium(
        color: AppColors.textGray,
        fontSize: AppFontSize.s14,
      ),
      unselectedLabelStyle: AppTextStyles.medium(
        color: AppColors.textGray,
        fontSize: AppFontSize.s14,
      ),
    );
  }

  static PageTransitionsTheme _pageTransitionsTheme() {
    return const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    );
  }

  static TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.bold(
          color: AppColors.textWhite,
          fontSize: AppFontSize.s14,
        ),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: ElevationApp.ev2,
        padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p24),
        fixedSize: const Size(ButtonSizeApp.width, ButtonSizeApp.height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
        ),
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.secondary,
        textStyle: AppTextStyles.bold(
          color: AppColors.bgWhite,
          fontSize: AppFontSize.s16,
        ),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.bgWhite,
        foregroundColor: AppColors.primary,
        fixedSize: const Size.fromHeight(SizeApp.s44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
          side: BorderSide(color: AppColors.primary, width: BorderWidthApp.w2),
        ),
        side: BorderSide(color: AppColors.primary, width: BorderWidthApp.w2),
        textStyle: AppTextStyles.bold(color: AppColors.primary),
      ),
    );
  }

  static FilledButtonThemeData _filledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusApp.r12),
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondaryLight,
      contentPadding: const EdgeInsets.all(PaddingApp.p12),
      errorMaxLines: 2,
      hintStyle: AppTextStyles.regular(
        color: AppColors.textGray,
        fontSize: AppFontSize.s16,
      ).copyWith(letterSpacing: 0),
      labelStyle: AppTextStyles.medium(
        color: AppColors.border,
        fontSize: AppFontSize.s14,
      ),
      errorStyle: AppTextStyles.regular(
        color: AppColors.error,
        fontSize: AppFontSize.s10,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.textGray,
          width: BorderWidthApp.w1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(BorderRadiusApp.r8),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.border,
          width: BorderWidthApp.w1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(BorderRadiusApp.r8),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondary,
          width: BorderWidthApp.w2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(BorderRadiusApp.r8),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.error,
          width: BorderWidthApp.w1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(BorderRadiusApp.r8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.error,
          width: BorderWidthApp.w2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(BorderRadiusApp.r8),
        ),
      ),
    );
  }

  static TextTheme _textTheme() {
    return TextTheme(
      bodyMedium: AppTextStyles.medium(
        color: AppColors.textBlack,
        fontSize: AppFontSize.s16,
      ),
      bodySmall: AppTextStyles.medium(
        color: AppColors.textBlack,
        fontSize: AppFontSize.s14,
      ),
      bodyLarge: AppTextStyles.medium(
        color: AppColors.textBlack,
        fontSize: AppFontSize.s18,
      ),
    );
  }

  static TimePickerThemeData _timePickerTheme() {
    return TimePickerThemeData(
      backgroundColor: AppColors.primary,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.primary,
        filled: true,
      ),
      timeSelectorSeparatorColor: WidgetStateProperty.all(
        AppColors.textWhite,
      ),
      dialTextColor: AppColors.textBlack,
      dialBackgroundColor: AppColors.primary,
      dialHandColor: AppColors.primary,
      dayPeriodColor: AppColors.primary,
      dayPeriodTextColor: AppColors.textBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusApp.r28),
      ),
      entryModeIconColor: AppColors.primary,
    );
  }
}
