import 'dart:math' as math;

class NumberUtils {}

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
