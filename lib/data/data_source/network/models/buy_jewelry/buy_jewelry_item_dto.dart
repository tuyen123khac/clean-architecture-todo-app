import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/buy_jewelry/jewelry_category_enum_entity.dart';
import '../../../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';
import 'buy_jewelry_category_enum_dto.dart';

part 'buy_jewelry_item_dto.freezed.dart';
part 'buy_jewelry_item_dto.g.dart';

@freezed
abstract class BuyJewelryItemDto with _$BuyJewelryItemDto {
  const BuyJewelryItemDto._();

  const factory BuyJewelryItemDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'category') required BuyJewelryCategoryEnumDto category,
    @JsonKey(name: 'price') required int price,
    @JsonKey(name: 'original_price') int? originalPrice,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'weight') String? weight,
    @JsonKey(name: 'size') String? size,
    @JsonKey(name: 'material') String? material,
    @JsonKey(name: 'stock') @Default(0) int stock,
    @JsonKey(name: 'rating') @Default(0.0) double rating,
    @JsonKey(name: 'review_count') @Default(0) int reviewCount,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'features') @Default([]) List<String> features,
    @JsonKey(name: 'is_certified') @Default(false) bool isCertified,
  }) = _BuyJewelryItemDto;

  factory BuyJewelryItemDto.fromJson(Map<String, dynamic> json) =>
      _$BuyJewelryItemDtoFromJson(json);
}

extension BuyJewelryItemDtoExtension on BuyJewelryItemDto {
  BuyJewelryEntity toEntity() => BuyJewelryEntity(
        id: id.toString(),
        name: name,
        category: JewelryCategoryEnumEntity.fromString(category.name),
        price: price.toDouble(),
        originalPrice: originalPrice?.toDouble(),
        imageUrl: imageUrl,
        weight: weight,
        size: size,
        material: material,
        stock: stock,
        rating: rating,
        reviewCount: reviewCount,
        description: description,
        features: features,
        isCertified: isCertified,
      );
}
