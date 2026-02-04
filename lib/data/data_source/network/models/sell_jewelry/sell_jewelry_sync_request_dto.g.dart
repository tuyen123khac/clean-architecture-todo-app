// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_jewelry_sync_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SellJewelrySyncRequestDto _$SellJewelrySyncRequestDtoFromJson(
  Map<String, dynamic> json,
) => _SellJewelrySyncRequestDto(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String,
  price: (json['price'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
);

Map<String, dynamic> _$SellJewelrySyncRequestDtoToJson(
  _SellJewelrySyncRequestDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'price': instance.price,
  'stock': instance.stock,
};
