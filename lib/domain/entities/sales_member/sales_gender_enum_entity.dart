import '../../../application/resource/strings/app_strings.dart';

enum SalesGenderEnumEntity {
  male('male'),
  female('female'),
  other('other');

  final String name;

  const SalesGenderEnumEntity(this.name);

  String get fullName {
    switch (this) {
      case SalesGenderEnumEntity.male:
        return AppStrings.male;
      case SalesGenderEnumEntity.female:
        return AppStrings.female;
      case SalesGenderEnumEntity.other:
        return AppStrings.other;
    }
  }

  static SalesGenderEnumEntity fromString(String name) {
    return SalesGenderEnumEntity.values.firstWhere((e) => e.name == name);
  }
}
