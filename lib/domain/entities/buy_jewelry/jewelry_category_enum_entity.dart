import '../../../application/resource/strings/app_strings.dart';

enum JewelryCategoryEnumEntity {
  goldSjc('goldSjc'),
  gold24k('gold24k'),
  gold18k('gold18k'),
  gold14k('gold14k'),
  goldWhite('goldWhite'),
  gemstone('gemstone');

  final String name;
  const JewelryCategoryEnumEntity(this.name);

  String get fullName {
    switch (this) {
      case JewelryCategoryEnumEntity.goldSjc:
        return AppStrings.sjcGold;
      case JewelryCategoryEnumEntity.gold24k:
        return AppStrings.gold24K;
      case JewelryCategoryEnumEntity.gold18k:
        return AppStrings.gold18K;
      case JewelryCategoryEnumEntity.gold14k:
        return AppStrings.gold14K;
      case JewelryCategoryEnumEntity.goldWhite:
        return AppStrings.whiteGold;
      case JewelryCategoryEnumEntity.gemstone:
        return AppStrings.gemstone;
    }
  }

  static JewelryCategoryEnumEntity fromString(String name) {
    return JewelryCategoryEnumEntity.values.firstWhere((e) => e.name == name);
  }
}
