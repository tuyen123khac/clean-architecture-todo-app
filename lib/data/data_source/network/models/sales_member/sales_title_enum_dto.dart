import 'package:freezed_annotation/freezed_annotation.dart';

enum SalesTitleEnumDto {
  @JsonValue('salesManager')
  salesManager('salesManager'),
  
  @JsonValue('salesSpecialist')
  salesSpecialist('salesSpecialist'),

  @JsonValue('seniorSalesRep')
  seniorSalesRep('seniorSalesRep'),

  @JsonValue('salesTeamLead')
  salesTeamLead('salesTeamLead'),

  @JsonValue('salesRep')
  salesRep('salesRep');

  final String name;
  const SalesTitleEnumDto(this.name);

  static SalesTitleEnumDto fromString(String name) {
    return SalesTitleEnumDto.values.firstWhere((e) => e.name == name);
  }
}
