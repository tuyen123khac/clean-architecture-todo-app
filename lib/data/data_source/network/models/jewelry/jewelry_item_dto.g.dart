// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jewelry_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JewelryItemDto _$JewelryItemDtoFromJson(Map<String, dynamic> json) =>
    _JewelryItemDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      category: $enumDecode(_$JewelryCategoryEnumDtoEnumMap, json['category']),
      price: (json['price'] as num).toInt(),
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$JewelryItemDtoToJson(_JewelryItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$JewelryCategoryEnumDtoEnumMap[instance.category]!,
      'price': instance.price,
      'image_url': instance.imageUrl,
    };

const _$JewelryCategoryEnumDtoEnumMap = {
  JewelryCategoryEnumDto.goldSjc: 'goldSjc',
  JewelryCategoryEnumDto.gold24k: 'gold24k',
  JewelryCategoryEnumDto.gold18k: 'gold18k',
  JewelryCategoryEnumDto.gold14k: 'gold14k',
  JewelryCategoryEnumDto.goldWhite: 'goldWhite',
  JewelryCategoryEnumDto.gemstone: 'gemstone',
};
