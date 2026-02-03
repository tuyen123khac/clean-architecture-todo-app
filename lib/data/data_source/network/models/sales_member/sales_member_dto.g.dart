// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesMemberDto _$SalesMemberDtoFromJson(Map<String, dynamic> json) =>
    _SalesMemberDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
      title: $enumDecode(_$SalesTitleEnumDtoEnumMap, json['title']),
      phoneNumber: json['phone_number'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$SalesMemberDtoToJson(_SalesMemberDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'age': instance.age,
      'title': _$SalesTitleEnumDtoEnumMap[instance.title]!,
      'phone_number': instance.phoneNumber,
      'description': instance.description,
      'image_url': instance.imageUrl,
    };

const _$SalesTitleEnumDtoEnumMap = {
  SalesTitleEnumDto.salesManager: 'salesManager',
  SalesTitleEnumDto.salesSpecialist: 'salesSpecialist',
  SalesTitleEnumDto.seniorSalesRep: 'seniorSalesRep',
  SalesTitleEnumDto.salesTeamLead: 'salesTeamLead',
  SalesTitleEnumDto.salesRep: 'salesRep',
};
