// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buy_jewelry_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuyJewelryItemDto {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'category') BuyJewelryCategoryEnumDto get category;@JsonKey(name: 'price') int get price;@JsonKey(name: 'original_price') int? get originalPrice;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'weight') String? get weight;@JsonKey(name: 'size') String? get size;@JsonKey(name: 'material') String? get material;@JsonKey(name: 'stock') int get stock;@JsonKey(name: 'rating') double get rating;@JsonKey(name: 'review_count') int get reviewCount;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'features') List<String> get features;@JsonKey(name: 'is_certified') bool get isCertified;
/// Create a copy of BuyJewelryItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyJewelryItemDtoCopyWith<BuyJewelryItemDto> get copyWith => _$BuyJewelryItemDtoCopyWithImpl<BuyJewelryItemDto>(this as BuyJewelryItemDto, _$identity);

  /// Serializes this BuyJewelryItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyJewelryItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.size, size) || other.size == size)&&(identical(other.material, material) || other.material == material)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.isCertified, isCertified) || other.isCertified == isCertified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,price,originalPrice,imageUrl,weight,size,material,stock,rating,reviewCount,description,const DeepCollectionEquality().hash(features),isCertified);

@override
String toString() {
  return 'BuyJewelryItemDto(id: $id, name: $name, category: $category, price: $price, originalPrice: $originalPrice, imageUrl: $imageUrl, weight: $weight, size: $size, material: $material, stock: $stock, rating: $rating, reviewCount: $reviewCount, description: $description, features: $features, isCertified: $isCertified)';
}


}

/// @nodoc
abstract mixin class $BuyJewelryItemDtoCopyWith<$Res>  {
  factory $BuyJewelryItemDtoCopyWith(BuyJewelryItemDto value, $Res Function(BuyJewelryItemDto) _then) = _$BuyJewelryItemDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'category') BuyJewelryCategoryEnumDto category,@JsonKey(name: 'price') int price,@JsonKey(name: 'original_price') int? originalPrice,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'weight') String? weight,@JsonKey(name: 'size') String? size,@JsonKey(name: 'material') String? material,@JsonKey(name: 'stock') int stock,@JsonKey(name: 'rating') double rating,@JsonKey(name: 'review_count') int reviewCount,@JsonKey(name: 'description') String? description,@JsonKey(name: 'features') List<String> features,@JsonKey(name: 'is_certified') bool isCertified
});




}
/// @nodoc
class _$BuyJewelryItemDtoCopyWithImpl<$Res>
    implements $BuyJewelryItemDtoCopyWith<$Res> {
  _$BuyJewelryItemDtoCopyWithImpl(this._self, this._then);

  final BuyJewelryItemDto _self;
  final $Res Function(BuyJewelryItemDto) _then;

/// Create a copy of BuyJewelryItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? price = null,Object? originalPrice = freezed,Object? imageUrl = null,Object? weight = freezed,Object? size = freezed,Object? material = freezed,Object? stock = null,Object? rating = null,Object? reviewCount = null,Object? description = freezed,Object? features = null,Object? isCertified = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BuyJewelryCategoryEnumDto,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,isCertified: null == isCertified ? _self.isCertified : isCertified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BuyJewelryItemDto].
extension BuyJewelryItemDtoPatterns on BuyJewelryItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuyJewelryItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuyJewelryItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuyJewelryItemDto value)  $default,){
final _that = this;
switch (_that) {
case _BuyJewelryItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuyJewelryItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _BuyJewelryItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'category')  BuyJewelryCategoryEnumDto category, @JsonKey(name: 'price')  int price, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'weight')  String? weight, @JsonKey(name: 'size')  String? size, @JsonKey(name: 'material')  String? material, @JsonKey(name: 'stock')  int stock, @JsonKey(name: 'rating')  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'features')  List<String> features, @JsonKey(name: 'is_certified')  bool isCertified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuyJewelryItemDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.price,_that.originalPrice,_that.imageUrl,_that.weight,_that.size,_that.material,_that.stock,_that.rating,_that.reviewCount,_that.description,_that.features,_that.isCertified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'category')  BuyJewelryCategoryEnumDto category, @JsonKey(name: 'price')  int price, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'weight')  String? weight, @JsonKey(name: 'size')  String? size, @JsonKey(name: 'material')  String? material, @JsonKey(name: 'stock')  int stock, @JsonKey(name: 'rating')  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'features')  List<String> features, @JsonKey(name: 'is_certified')  bool isCertified)  $default,) {final _that = this;
switch (_that) {
case _BuyJewelryItemDto():
return $default(_that.id,_that.name,_that.category,_that.price,_that.originalPrice,_that.imageUrl,_that.weight,_that.size,_that.material,_that.stock,_that.rating,_that.reviewCount,_that.description,_that.features,_that.isCertified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'category')  BuyJewelryCategoryEnumDto category, @JsonKey(name: 'price')  int price, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'weight')  String? weight, @JsonKey(name: 'size')  String? size, @JsonKey(name: 'material')  String? material, @JsonKey(name: 'stock')  int stock, @JsonKey(name: 'rating')  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'features')  List<String> features, @JsonKey(name: 'is_certified')  bool isCertified)?  $default,) {final _that = this;
switch (_that) {
case _BuyJewelryItemDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.price,_that.originalPrice,_that.imageUrl,_that.weight,_that.size,_that.material,_that.stock,_that.rating,_that.reviewCount,_that.description,_that.features,_that.isCertified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuyJewelryItemDto extends BuyJewelryItemDto {
  const _BuyJewelryItemDto({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'category') required this.category, @JsonKey(name: 'price') required this.price, @JsonKey(name: 'original_price') this.originalPrice, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'weight') this.weight, @JsonKey(name: 'size') this.size, @JsonKey(name: 'material') this.material, @JsonKey(name: 'stock') this.stock = 0, @JsonKey(name: 'rating') this.rating = 0.0, @JsonKey(name: 'review_count') this.reviewCount = 0, @JsonKey(name: 'description') this.description, @JsonKey(name: 'features') final  List<String> features = const [], @JsonKey(name: 'is_certified') this.isCertified = false}): _features = features,super._();
  factory _BuyJewelryItemDto.fromJson(Map<String, dynamic> json) => _$BuyJewelryItemDtoFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'category') final  BuyJewelryCategoryEnumDto category;
@override@JsonKey(name: 'price') final  int price;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'weight') final  String? weight;
@override@JsonKey(name: 'size') final  String? size;
@override@JsonKey(name: 'material') final  String? material;
@override@JsonKey(name: 'stock') final  int stock;
@override@JsonKey(name: 'rating') final  double rating;
@override@JsonKey(name: 'review_count') final  int reviewCount;
@override@JsonKey(name: 'description') final  String? description;
 final  List<String> _features;
@override@JsonKey(name: 'features') List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override@JsonKey(name: 'is_certified') final  bool isCertified;

/// Create a copy of BuyJewelryItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyJewelryItemDtoCopyWith<_BuyJewelryItemDto> get copyWith => __$BuyJewelryItemDtoCopyWithImpl<_BuyJewelryItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuyJewelryItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyJewelryItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.size, size) || other.size == size)&&(identical(other.material, material) || other.material == material)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.isCertified, isCertified) || other.isCertified == isCertified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,price,originalPrice,imageUrl,weight,size,material,stock,rating,reviewCount,description,const DeepCollectionEquality().hash(_features),isCertified);

@override
String toString() {
  return 'BuyJewelryItemDto(id: $id, name: $name, category: $category, price: $price, originalPrice: $originalPrice, imageUrl: $imageUrl, weight: $weight, size: $size, material: $material, stock: $stock, rating: $rating, reviewCount: $reviewCount, description: $description, features: $features, isCertified: $isCertified)';
}


}

/// @nodoc
abstract mixin class _$BuyJewelryItemDtoCopyWith<$Res> implements $BuyJewelryItemDtoCopyWith<$Res> {
  factory _$BuyJewelryItemDtoCopyWith(_BuyJewelryItemDto value, $Res Function(_BuyJewelryItemDto) _then) = __$BuyJewelryItemDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'category') BuyJewelryCategoryEnumDto category,@JsonKey(name: 'price') int price,@JsonKey(name: 'original_price') int? originalPrice,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'weight') String? weight,@JsonKey(name: 'size') String? size,@JsonKey(name: 'material') String? material,@JsonKey(name: 'stock') int stock,@JsonKey(name: 'rating') double rating,@JsonKey(name: 'review_count') int reviewCount,@JsonKey(name: 'description') String? description,@JsonKey(name: 'features') List<String> features,@JsonKey(name: 'is_certified') bool isCertified
});




}
/// @nodoc
class __$BuyJewelryItemDtoCopyWithImpl<$Res>
    implements _$BuyJewelryItemDtoCopyWith<$Res> {
  __$BuyJewelryItemDtoCopyWithImpl(this._self, this._then);

  final _BuyJewelryItemDto _self;
  final $Res Function(_BuyJewelryItemDto) _then;

/// Create a copy of BuyJewelryItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? price = null,Object? originalPrice = freezed,Object? imageUrl = null,Object? weight = freezed,Object? size = freezed,Object? material = freezed,Object? stock = null,Object? rating = null,Object? reviewCount = null,Object? description = freezed,Object? features = null,Object? isCertified = null,}) {
  return _then(_BuyJewelryItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BuyJewelryCategoryEnumDto,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,isCertified: null == isCertified ? _self.isCertified : isCertified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
