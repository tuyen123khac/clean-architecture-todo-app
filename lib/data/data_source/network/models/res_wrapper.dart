import 'package:freezed_annotation/freezed_annotation.dart';

part 'res_wrapper.freezed.dart';
part 'res_wrapper.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ResWrapper<T> with _$ResWrapper<T> {
  const factory ResWrapper({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'data') required T data,
  }) = _ResWrapper;

  factory ResWrapper.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ResWrapperFromJson(json, fromJsonT);
}
