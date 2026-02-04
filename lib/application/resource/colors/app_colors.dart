import 'package:flutter/material.dart';

class AppColors {
  //  Essential colors
  static Color primary = HexColor.fromHex("#FFA726");
  static Color secondary = HexColor.fromHex("#FFCC80");
  static Color secondaryLight = HexColor.fromHex("#FFF3E0");

  static Color bgBlack = HexColor.fromHex("#0D0D0D");
  static Color bgBlackGray = HexColor.fromHex("#1A1A1A");
  static Color bgGray = HexColor.fromHex("#262626");
  static Color bgLightGray = HexColor.fromHex("#F5F5F5");
  static Color bgWhite = HexColor.fromHex("#FAFAFA");

  static Color border = HexColor.fromHex("#7A7A7A");

  static Color textBlack = HexColor.fromHex("#1A1A1A");
  static Color textDarkGray = HexColor.fromHex("#4A4A4A");
  static Color textGray = HexColor.fromHex("#B3B3B3");
  static Color textWhite = HexColor.fromHex("#F2F2F2");

  static Color success = HexColor.fromHex("#25B84C");
  static Color successLight = HexColor.fromHex("#E8F5E9");
  static Color error = HexColor.fromHex("#E12424");
  static Color errorLight = HexColor.fromHex("#FFEBEE");
  static Color warning = HexColor.fromHex("#F57C00");
  static Color warningLight = HexColor.fromHex("#FFF3E0");
  static Color info = HexColor.fromHex("#00897B");
  static Color infoLight = HexColor.fromHex("#E0F2F1");

  // Gender colors
  static Color male = HexColor.fromHex("#2196F3");
  static Color maleLight = HexColor.fromHex("#E3F2FD");
  static Color female = HexColor.fromHex("#E91E63");
  static Color femaleLight = HexColor.fromHex("#FCE4EC");

  // Rating/favorite colors
  static Color favorite = HexColor.fromHex("#E91E63");
  static Color favoriteLight = HexColor.fromHex("#FCE4EC");
  static Color rating = HexColor.fromHex("#FFC107");

  // Premium/Certified colors
  static Color premium = HexColor.fromHex("#FFA000");
  static Color premiumLight = HexColor.fromHex("#FFF8E1");
  static Color premiumBorder = HexColor.fromHex("#FFECB3");

  // Shadow color
  static Color shadow = HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = "FF$hex"; // 8 char with opacity 100%
    }
    return Color(int.parse(hex, radix: 16));
  }
}
