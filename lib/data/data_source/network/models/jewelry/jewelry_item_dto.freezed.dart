// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jewelry_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JewelryItemDto {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'category') JewelryCategoryEnumDto get category;@JsonKey(name: 'price') int get price;@JsonKey(name: 'image_url') String get imageUrl;
/// Create a copy of JewelryItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JewelryItemDtoCopyWith<JewelryItemDto> get copyWith => _$JewelryItemDtoCopyWithImpl<JewelryItemDto>(this as JewelryItemDto, _$identity);

  /// Serializes this JewelryItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JewelryItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,price,imageUrl);

@override
String toString() {
  return 'JewelryItemDto(id: $id, name: $name, category: $category, price: $price, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $JewelryItemDtoCopyWith<$Res>  {
  factory $JewelryItemDtoCopyWith(JewelryItemDto value, $Res Function(JewelryItemDto) _then) = _$JewelryItemDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'category') JewelryCategoryEnumDto category,@JsonKey(name: 'price') int price,@JsonKey(name: 'image_url') String imageUrl
});




}
/// @nodoc
class _$JewelryItemDtoCopyWithImpl<$Res>
    implements $JewelryItemDtoCopyWith<$Res> {
  _$JewelryItemDtoCopyWithImpl(this._self, this._then);

  final JewelryItemDto _self;
  final $Res Function(JewelryItemDto) _then;

/// Create a copy of JewelryItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? price = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as JewelryCategoryEnumDto,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JewelryItemDto].
extension JewelryItemDtoPatterns on JewelryItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JewelryItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JewelryItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JewelryItemDto value)  $default,){
final _that = this;
switch (_that) {
case _JewelryItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JewelryItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _JewelryItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'category')  JewelryCategoryEnumDto category, @JsonKey(name: 'price')  int price, @JsonKey(name: 'image_url')  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JewelryItemDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.price,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'category')  JewelryCategoryEnumDto category, @JsonKey(name: 'price')  int price, @JsonKey(name: 'image_url')  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _JewelryItemDto():
return $default(_that.id,_that.name,_that.category,_that.price,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'category')  JewelryCategoryEnumDto category, @JsonKey(name: 'price')  int price, @JsonKey(name: 'image_url')  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _JewelryItemDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.price,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JewelryItemDto extends JewelryItemDto {
  const _JewelryItemDto({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'category') required this.category, @JsonKey(name: 'price') required this.price, @JsonKey(name: 'image_url') required this.imageUrl}): super._();
  factory _JewelryItemDto.fromJson(Map<String, dynamic> json) => _$JewelryItemDtoFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'category') final  JewelryCategoryEnumDto category;
@override@JsonKey(name: 'price') final  int price;
@override@JsonKey(name: 'image_url') final  String imageUrl;

/// Create a copy of JewelryItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JewelryItemDtoCopyWith<_JewelryItemDto> get copyWith => __$JewelryItemDtoCopyWithImpl<_JewelryItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JewelryItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JewelryItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,price,imageUrl);

@override
String toString() {
  return 'JewelryItemDto(id: $id, name: $name, category: $category, price: $price, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$JewelryItemDtoCopyWith<$Res> implements $JewelryItemDtoCopyWith<$Res> {
  factory _$JewelryItemDtoCopyWith(_JewelryItemDto value, $Res Function(_JewelryItemDto) _then) = __$JewelryItemDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'category') JewelryCategoryEnumDto category,@JsonKey(name: 'price') int price,@JsonKey(name: 'image_url') String imageUrl
});




}
/// @nodoc
class __$JewelryItemDtoCopyWithImpl<$Res>
    implements _$JewelryItemDtoCopyWith<$Res> {
  __$JewelryItemDtoCopyWithImpl(this._self, this._then);

  final _JewelryItemDto _self;
  final $Res Function(_JewelryItemDto) _then;

/// Create a copy of JewelryItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? price = null,Object? imageUrl = null,}) {
  return _then(_JewelryItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as JewelryCategoryEnumDto,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
