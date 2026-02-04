import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_jewelry_sync_request_dto.freezed.dart';
part 'sell_jewelry_sync_request_dto.g.dart';

@freezed
abstract class SellJewelrySyncRequestDto with _$SellJewelrySyncRequestDto {
  const factory SellJewelrySyncRequestDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'price') required double price,
    @JsonKey(name: 'stock') required int stock,
  }) = _SellJewelrySyncRequestDto;

  factory SellJewelrySyncRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SellJewelrySyncRequestDtoFromJson(json);
}
