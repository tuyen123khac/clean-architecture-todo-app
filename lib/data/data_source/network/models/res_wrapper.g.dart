// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResWrapper<T> _$ResWrapperFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ResWrapper<T>(data: fromJsonT(json['data']), metadata: json['metadata']);

Map<String, dynamic> _$ResWrapperToJson<T>(
  _ResWrapper<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'metadata': instance.metadata,
};
