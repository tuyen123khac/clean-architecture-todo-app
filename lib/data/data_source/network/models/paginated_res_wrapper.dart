import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_res_wrapper.freezed.dart';
part 'paginated_res_wrapper.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginatedResWrapper<T> with _$PaginatedResWrapper<T> {
  const factory PaginatedResWrapper({
    @JsonKey(name: 'data') required T data,
    @JsonKey(name: 'total') required int total,
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'limit') required int limit,
    @JsonKey(name: 'hasMore') required bool hasMore,
  }) = _PaginatedResWrapper;

  factory PaginatedResWrapper.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginatedResWrapperFromJson(json, fromJsonT);
}
