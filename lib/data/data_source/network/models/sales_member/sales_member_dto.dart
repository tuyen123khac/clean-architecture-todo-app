import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/sales_member/sales_gender_enum_entity.dart';
import '../../../../../domain/entities/sales_member/sales_member_entity.dart';
import '../../../../../domain/entities/sales_member/sales_title_enum_entity.dart';
import 'sales_title_enum_dto.dart';

part 'sales_member_dto.freezed.dart';
part 'sales_member_dto.g.dart';

@freezed
abstract class SalesMemberDto with _$SalesMemberDto {
  const SalesMemberDto._();

  const factory SalesMemberDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'gender') required String gender,
    @JsonKey(name: 'age') required int age,
    @JsonKey(name: 'title') required SalesTitleEnumDto title,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _SalesMemberDto;

  factory SalesMemberDto.fromJson(Map<String, dynamic> json) =>
      _$SalesMemberDtoFromJson(json);
}

extension SalesMemberDtoExtension on SalesMemberDto {
  SalesMemberEntity toEntity() => SalesMemberEntity(
        id: id,
        name: name,
        gender: SalesGenderEnumEntity.fromString(gender),
        age: age,
        title: SalesTitleEnumEntity.fromString(title.name),
        phone: phoneNumber,
        description: description,
        imageUrl: imageUrl,
      );
}