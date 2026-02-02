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
  static Color error = HexColor.fromHex("#E12424");
  
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
