import 'dart:math' as math;

import 'package:intl/intl.dart';

class NumberUtils {
  NumberUtils._();

  /// Formats [price] as Vietnamese locale with "đ" suffix (e.g. "1.234.567đ").
  static String formatPrice(double price) {
    final formatter = NumberFormat('#,###', 'vi_VN');
    return '${formatter.format(price)}đ';
  }
}

extension DoubleExt on double {
  double roundDecimal([int? decimals]) {
    decimals ??= 0;

    if (decimals < 0) {
      decimals = 0;
    }

    final factor = math.pow(10, decimals);

    return (this * factor).round() / factor;
  }
}
