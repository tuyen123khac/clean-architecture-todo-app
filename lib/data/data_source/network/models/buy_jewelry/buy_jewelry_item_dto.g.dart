// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_jewelry_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuyJewelryItemDto _$BuyJewelryItemDtoFromJson(
  Map<String, dynamic> json,
) => _BuyJewelryItemDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  category: $enumDecode(_$BuyJewelryCategoryEnumDtoEnumMap, json['category']),
  price: (json['price'] as num).toInt(),
  originalPrice: (json['original_price'] as num?)?.toInt(),
  imageUrl: json['image_url'] as String,
  weight: json['weight'] as String?,
  size: json['size'] as String?,
  material: json['material'] as String?,
  stock: (json['stock'] as num?)?.toInt() ?? 0,
  rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
  reviewCount: (json['review_count'] as num?)?.toInt() ?? 0,
  description: json['description'] as String?,
  features:
      (json['features'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  isCertified: json['is_certified'] as bool? ?? false,
);

Map<String, dynamic> _$BuyJewelryItemDtoToJson(_BuyJewelryItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$BuyJewelryCategoryEnumDtoEnumMap[instance.category]!,
      'price': instance.price,
      'original_price': instance.originalPrice,
      'image_url': instance.imageUrl,
      'weight': instance.weight,
      'size': instance.size,
      'material': instance.material,
      'stock': instance.stock,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'description': instance.description,
      'features': instance.features,
      'is_certified': instance.isCertified,
    };

const _$BuyJewelryCategoryEnumDtoEnumMap = {
  BuyJewelryCategoryEnumDto.goldSjc: 'goldSjc',
  BuyJewelryCategoryEnumDto.gold24k: 'gold24k',
  BuyJewelryCategoryEnumDto.gold18k: 'gold18k',
  BuyJewelryCategoryEnumDto.gold14k: 'gold14k',
  BuyJewelryCategoryEnumDto.goldWhite: 'goldWhite',
  BuyJewelryCategoryEnumDto.gemstone: 'gemstone',
};
