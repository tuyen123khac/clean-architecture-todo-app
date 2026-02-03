// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_res_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedResWrapper<T> _$PaginatedResWrapperFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PaginatedResWrapper<T>(
  data: fromJsonT(json['data']),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  hasMore: json['hasMore'] as bool,
);

Map<String, dynamic> _$PaginatedResWrapperToJson<T>(
  _PaginatedResWrapper<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'hasMore': instance.hasMore,
};
