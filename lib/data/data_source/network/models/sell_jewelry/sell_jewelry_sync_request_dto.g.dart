// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_jewelry_sync_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellJewelrySyncRequestDto _$SellJewelrySyncRequestDtoFromJson(
  Map<String, dynamic> json,
) => SellJewelrySyncRequestDto(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String,
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$SellJewelrySyncRequestDtoToJson(
  SellJewelrySyncRequestDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'price': instance.price,
};
