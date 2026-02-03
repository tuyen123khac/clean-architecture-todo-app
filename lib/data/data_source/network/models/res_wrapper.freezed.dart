// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResWrapper<T> {

// ignore: invalid_annotation_target
@JsonKey(name: 'data') T get data;
/// Create a copy of ResWrapper
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResWrapperCopyWith<T, ResWrapper<T>> get copyWith => _$ResWrapperCopyWithImpl<T, ResWrapper<T>>(this as ResWrapper<T>, _$identity);

  /// Serializes this ResWrapper to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResWrapper<T>&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ResWrapper<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class $ResWrapperCopyWith<T,$Res>  {
  factory $ResWrapperCopyWith(ResWrapper<T> value, $Res Function(ResWrapper<T>) _then) = _$ResWrapperCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'data') T data
});




}
/// @nodoc
class _$ResWrapperCopyWithImpl<T,$Res>
    implements $ResWrapperCopyWith<T, $Res> {
  _$ResWrapperCopyWithImpl(this._self, this._then);

  final ResWrapper<T> _self;
  final $Res Function(ResWrapper<T>) _then;

/// Create a copy of ResWrapper
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// Adds pattern-matching-related methods to [ResWrapper].
extension ResWrapperPatterns<T> on ResWrapper<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResWrapper<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResWrapper() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResWrapper<T> value)  $default,){
final _that = this;
switch (_that) {
case _ResWrapper():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResWrapper<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ResWrapper() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'data')  T data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResWrapper() when $default != null:
return $default(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'data')  T data)  $default,) {final _that = this;
switch (_that) {
case _ResWrapper():
return $default(_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'data')  T data)?  $default,) {final _that = this;
switch (_that) {
case _ResWrapper() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ResWrapper<T> implements ResWrapper<T> {
  const _ResWrapper({@JsonKey(name: 'data') required this.data});
  factory _ResWrapper.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ResWrapperFromJson(json,fromJsonT);

// ignore: invalid_annotation_target
@override@JsonKey(name: 'data') final  T data;

/// Create a copy of ResWrapper
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResWrapperCopyWith<T, _ResWrapper<T>> get copyWith => __$ResWrapperCopyWithImpl<T, _ResWrapper<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ResWrapperToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResWrapper<T>&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ResWrapper<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ResWrapperCopyWith<T,$Res> implements $ResWrapperCopyWith<T, $Res> {
  factory _$ResWrapperCopyWith(_ResWrapper<T> value, $Res Function(_ResWrapper<T>) _then) = __$ResWrapperCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'data') T data
});




}
/// @nodoc
class __$ResWrapperCopyWithImpl<T,$Res>
    implements _$ResWrapperCopyWith<T, $Res> {
  __$ResWrapperCopyWithImpl(this._self, this._then);

  final _ResWrapper<T> _self;
  final $Res Function(_ResWrapper<T>) _then;

/// Create a copy of ResWrapper
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_ResWrapper<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on
