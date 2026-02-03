import '../../../application/resource/strings/app_strings.dart';

enum SalesTitleEnumEntity {
  salesManager('salesManager'),
  salesSpecialist('salesSpecialist'),
  seniorSalesRep('seniorSalesRep'),
  salesTeamLead('salesTeamLead'),
  salesRep('salesRep');

  final String name;

  const SalesTitleEnumEntity(this.name);

  String get fullName {
    switch (this) {
      case SalesTitleEnumEntity.salesManager:
        return AppStrings.salesManager;
      case SalesTitleEnumEntity.salesSpecialist:
        return AppStrings.salesSpecialist;
      case SalesTitleEnumEntity.seniorSalesRep:
        return AppStrings.seniorSalesRep;
      case SalesTitleEnumEntity.salesTeamLead:
        return AppStrings.salesTeamLead;
      case SalesTitleEnumEntity.salesRep:
        return AppStrings.salesRep;
    }
  }

  static SalesTitleEnumEntity fromString(String name) {
    return SalesTitleEnumEntity.values.firstWhere((e) => e.name == name);
  }
}
