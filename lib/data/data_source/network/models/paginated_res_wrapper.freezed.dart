// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_res_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedResWrapper<T> {

@JsonKey(name: 'data') T get data;@JsonKey(name: 'total') int get total;@JsonKey(name: 'page') int get page;@JsonKey(name: 'limit') int get limit;@JsonKey(name: 'hasMore') bool get hasMore;
/// Create a copy of PaginatedResWrapper
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedResWrapperCopyWith<T, PaginatedResWrapper<T>> get copyWith => _$PaginatedResWrapperCopyWithImpl<T, PaginatedResWrapper<T>>(this as PaginatedResWrapper<T>, _$identity);

  /// Serializes this PaginatedResWrapper to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedResWrapper<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit,hasMore);

@override
String toString() {
  return 'PaginatedResWrapper<$T>(data: $data, total: $total, page: $page, limit: $limit, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $PaginatedResWrapperCopyWith<T,$Res>  {
  factory $PaginatedResWrapperCopyWith(PaginatedResWrapper<T> value, $Res Function(PaginatedResWrapper<T>) _then) = _$PaginatedResWrapperCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'data') T data,@JsonKey(name: 'total') int total,@JsonKey(name: 'page') int page,@JsonKey(name: 'limit') int limit,@JsonKey(name: 'hasMore') bool hasMore
});




}
/// @nodoc
class _$PaginatedResWrapperCopyWithImpl<T,$Res>
    implements $PaginatedResWrapperCopyWith<T, $Res> {
  _$PaginatedResWrapperCopyWithImpl(this._self, this._then);

  final PaginatedResWrapper<T> _self;
  final $Res Function(PaginatedResWrapper<T>) _then;

/// Create a copy of PaginatedResWrapper
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? total = null,Object? page = null,Object? limit = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedResWrapper].
extension PaginatedResWrapperPatterns<T> on PaginatedResWrapper<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedResWrapper<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedResWrapper() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedResWrapper<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedResWrapper():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedResWrapper<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedResWrapper() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'data')  T data, @JsonKey(name: 'total')  int total, @JsonKey(name: 'page')  int page, @JsonKey(name: 'limit')  int limit, @JsonKey(name: 'hasMore')  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedResWrapper() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'data')  T data, @JsonKey(name: 'total')  int total, @JsonKey(name: 'page')  int page, @JsonKey(name: 'limit')  int limit, @JsonKey(name: 'hasMore')  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _PaginatedResWrapper():
return $default(_that.data,_that.total,_that.page,_that.limit,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'data')  T data, @JsonKey(name: 'total')  int total, @JsonKey(name: 'page')  int page, @JsonKey(name: 'limit')  int limit, @JsonKey(name: 'hasMore')  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedResWrapper() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PaginatedResWrapper<T> implements PaginatedResWrapper<T> {
  const _PaginatedResWrapper({@JsonKey(name: 'data') required this.data, @JsonKey(name: 'total') required this.total, @JsonKey(name: 'page') required this.page, @JsonKey(name: 'limit') required this.limit, @JsonKey(name: 'hasMore') required this.hasMore});
  factory _PaginatedResWrapper.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PaginatedResWrapperFromJson(json,fromJsonT);

@override@JsonKey(name: 'data') final  T data;
@override@JsonKey(name: 'total') final  int total;
@override@JsonKey(name: 'page') final  int page;
@override@JsonKey(name: 'limit') final  int limit;
@override@JsonKey(name: 'hasMore') final  bool hasMore;

/// Create a copy of PaginatedResWrapper
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedResWrapperCopyWith<T, _PaginatedResWrapper<T>> get copyWith => __$PaginatedResWrapperCopyWithImpl<T, _PaginatedResWrapper<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PaginatedResWrapperToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedResWrapper<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit,hasMore);

@override
String toString() {
  return 'PaginatedResWrapper<$T>(data: $data, total: $total, page: $page, limit: $limit, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$PaginatedResWrapperCopyWith<T,$Res> implements $PaginatedResWrapperCopyWith<T, $Res> {
  factory _$PaginatedResWrapperCopyWith(_PaginatedResWrapper<T> value, $Res Function(_PaginatedResWrapper<T>) _then) = __$PaginatedResWrapperCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'data') T data,@JsonKey(name: 'total') int total,@JsonKey(name: 'page') int page,@JsonKey(name: 'limit') int limit,@JsonKey(name: 'hasMore') bool hasMore
});




}
/// @nodoc
class __$PaginatedResWrapperCopyWithImpl<T,$Res>
    implements _$PaginatedResWrapperCopyWith<T, $Res> {
  __$PaginatedResWrapperCopyWithImpl(this._self, this._then);

  final _PaginatedResWrapper<T> _self;
  final $Res Function(_PaginatedResWrapper<T>) _then;

/// Create a copy of PaginatedResWrapper
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? total = null,Object? page = null,Object? limit = null,Object? hasMore = null,}) {
  return _then(_PaginatedResWrapper<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
