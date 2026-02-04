// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_jewelry_sync_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SellJewelrySyncRequestDto {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'category') String get category;@JsonKey(name: 'price') double get price;@JsonKey(name: 'stock') int get stock;
/// Create a copy of SellJewelrySyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellJewelrySyncRequestDtoCopyWith<SellJewelrySyncRequestDto> get copyWith => _$SellJewelrySyncRequestDtoCopyWithImpl<SellJewelrySyncRequestDto>(this as SellJewelrySyncRequestDto, _$identity);

  /// Serializes this SellJewelrySyncRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellJewelrySyncRequestDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,price,stock);

@override
String toString() {
  return 'SellJewelrySyncRequestDto(id: $id, name: $name, category: $category, price: $price, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $SellJewelrySyncRequestDtoCopyWith<$Res>  {
  factory $SellJewelrySyncRequestDtoCopyWith(SellJewelrySyncRequestDto value, $Res Function(SellJewelrySyncRequestDto) _then) = _$SellJewelrySyncRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'category') String category,@JsonKey(name: 'price') double price,@JsonKey(name: 'stock') int stock
});




}
/// @nodoc
class _$SellJewelrySyncRequestDtoCopyWithImpl<$Res>
    implements $SellJewelrySyncRequestDtoCopyWith<$Res> {
  _$SellJewelrySyncRequestDtoCopyWithImpl(this._self, this._then);

  final SellJewelrySyncRequestDto _self;
  final $Res Function(SellJewelrySyncRequestDto) _then;

/// Create a copy of SellJewelrySyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? price = null,Object? stock = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SellJewelrySyncRequestDto].
extension SellJewelrySyncRequestDtoPatterns on SellJewelrySyncRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellJewelrySyncRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellJewelrySyncRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellJewelrySyncRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _SellJewelrySyncRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellJewelrySyncRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _SellJewelrySyncRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'category')  String category, @JsonKey(name: 'price')  double price, @JsonKey(name: 'stock')  int stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellJewelrySyncRequestDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.price,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'category')  String category, @JsonKey(name: 'price')  double price, @JsonKey(name: 'stock')  int stock)  $default,) {final _that = this;
switch (_that) {
case _SellJewelrySyncRequestDto():
return $default(_that.id,_that.name,_that.category,_that.price,_that.stock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'category')  String category, @JsonKey(name: 'price')  double price, @JsonKey(name: 'stock')  int stock)?  $default,) {final _that = this;
switch (_that) {
case _SellJewelrySyncRequestDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.price,_that.stock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellJewelrySyncRequestDto implements SellJewelrySyncRequestDto {
  const _SellJewelrySyncRequestDto({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'category') required this.category, @JsonKey(name: 'price') required this.price, @JsonKey(name: 'stock') required this.stock});
  factory _SellJewelrySyncRequestDto.fromJson(Map<String, dynamic> json) => _$SellJewelrySyncRequestDtoFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'category') final  String category;
@override@JsonKey(name: 'price') final  double price;
@override@JsonKey(name: 'stock') final  int stock;

/// Create a copy of SellJewelrySyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellJewelrySyncRequestDtoCopyWith<_SellJewelrySyncRequestDto> get copyWith => __$SellJewelrySyncRequestDtoCopyWithImpl<_SellJewelrySyncRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellJewelrySyncRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellJewelrySyncRequestDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,price,stock);

@override
String toString() {
  return 'SellJewelrySyncRequestDto(id: $id, name: $name, category: $category, price: $price, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$SellJewelrySyncRequestDtoCopyWith<$Res> implements $SellJewelrySyncRequestDtoCopyWith<$Res> {
  factory _$SellJewelrySyncRequestDtoCopyWith(_SellJewelrySyncRequestDto value, $Res Function(_SellJewelrySyncRequestDto) _then) = __$SellJewelrySyncRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'category') String category,@JsonKey(name: 'price') double price,@JsonKey(name: 'stock') int stock
});




}
/// @nodoc
class __$SellJewelrySyncRequestDtoCopyWithImpl<$Res>
    implements _$SellJewelrySyncRequestDtoCopyWith<$Res> {
  __$SellJewelrySyncRequestDtoCopyWithImpl(this._self, this._then);

  final _SellJewelrySyncRequestDto _self;
  final $Res Function(_SellJewelrySyncRequestDto) _then;

/// Create a copy of SellJewelrySyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? price = null,Object? stock = null,}) {
  return _then(_SellJewelrySyncRequestDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
