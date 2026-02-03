import 'package:freezed_annotation/freezed_annotation.dart';

import 'jewelry_category_enum_dto.dart';

part 'jewelry_item_dto.freezed.dart';
part 'jewelry_item_dto.g.dart';

@freezed
abstract class JewelryItemDto with _$JewelryItemDto {
  const JewelryItemDto._();

  const factory JewelryItemDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'category') required JewelryCategoryEnumDto category,
    @JsonKey(name: 'price') required int price,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _JewelryItemDto;

  factory JewelryItemDto.fromJson(Map<String, dynamic> json) =>
      _$JewelryItemDtoFromJson(json);
}
