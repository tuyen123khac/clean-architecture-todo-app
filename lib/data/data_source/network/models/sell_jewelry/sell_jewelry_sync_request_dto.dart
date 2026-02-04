import 'package:json_annotation/json_annotation.dart';

part 'sell_jewelry_sync_request_dto.g.dart';

@JsonSerializable()
class SellJewelrySyncRequestDto {
  final String id;
  final String name;
  final String category;
  final double price;

  const SellJewelrySyncRequestDto({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
  });

  factory SellJewelrySyncRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SellJewelrySyncRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SellJewelrySyncRequestDtoToJson(this);
}
