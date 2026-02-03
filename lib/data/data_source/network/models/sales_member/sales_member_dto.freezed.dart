// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesMemberDto {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'gender') String get gender;@JsonKey(name: 'age') int get age;@JsonKey(name: 'title') SalesTitleEnumDto get title;@JsonKey(name: 'phone_number') String get phoneNumber;@JsonKey(name: 'description') String get description;@JsonKey(name: 'image_url') String get imageUrl;
/// Create a copy of SalesMemberDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesMemberDtoCopyWith<SalesMemberDto> get copyWith => _$SalesMemberDtoCopyWithImpl<SalesMemberDto>(this as SalesMemberDto, _$identity);

  /// Serializes this SalesMemberDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesMemberDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.age, age) || other.age == age)&&(identical(other.title, title) || other.title == title)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,gender,age,title,phoneNumber,description,imageUrl);

@override
String toString() {
  return 'SalesMemberDto(id: $id, name: $name, gender: $gender, age: $age, title: $title, phoneNumber: $phoneNumber, description: $description, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $SalesMemberDtoCopyWith<$Res>  {
  factory $SalesMemberDtoCopyWith(SalesMemberDto value, $Res Function(SalesMemberDto) _then) = _$SalesMemberDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'gender') String gender,@JsonKey(name: 'age') int age,@JsonKey(name: 'title') SalesTitleEnumDto title,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'description') String description,@JsonKey(name: 'image_url') String imageUrl
});




}
/// @nodoc
class _$SalesMemberDtoCopyWithImpl<$Res>
    implements $SalesMemberDtoCopyWith<$Res> {
  _$SalesMemberDtoCopyWithImpl(this._self, this._then);

  final SalesMemberDto _self;
  final $Res Function(SalesMemberDto) _then;

/// Create a copy of SalesMemberDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? gender = null,Object? age = null,Object? title = null,Object? phoneNumber = null,Object? description = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as SalesTitleEnumDto,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesMemberDto].
extension SalesMemberDtoPatterns on SalesMemberDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesMemberDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesMemberDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesMemberDto value)  $default,){
final _that = this;
switch (_that) {
case _SalesMemberDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesMemberDto value)?  $default,){
final _that = this;
switch (_that) {
case _SalesMemberDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'gender')  String gender, @JsonKey(name: 'age')  int age, @JsonKey(name: 'title')  SalesTitleEnumDto title, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'description')  String description, @JsonKey(name: 'image_url')  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesMemberDto() when $default != null:
return $default(_that.id,_that.name,_that.gender,_that.age,_that.title,_that.phoneNumber,_that.description,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'gender')  String gender, @JsonKey(name: 'age')  int age, @JsonKey(name: 'title')  SalesTitleEnumDto title, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'description')  String description, @JsonKey(name: 'image_url')  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _SalesMemberDto():
return $default(_that.id,_that.name,_that.gender,_that.age,_that.title,_that.phoneNumber,_that.description,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'gender')  String gender, @JsonKey(name: 'age')  int age, @JsonKey(name: 'title')  SalesTitleEnumDto title, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'description')  String description, @JsonKey(name: 'image_url')  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _SalesMemberDto() when $default != null:
return $default(_that.id,_that.name,_that.gender,_that.age,_that.title,_that.phoneNumber,_that.description,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesMemberDto extends SalesMemberDto {
  const _SalesMemberDto({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'gender') required this.gender, @JsonKey(name: 'age') required this.age, @JsonKey(name: 'title') required this.title, @JsonKey(name: 'phone_number') required this.phoneNumber, @JsonKey(name: 'description') required this.description, @JsonKey(name: 'image_url') required this.imageUrl}): super._();
  factory _SalesMemberDto.fromJson(Map<String, dynamic> json) => _$SalesMemberDtoFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'gender') final  String gender;
@override@JsonKey(name: 'age') final  int age;
@override@JsonKey(name: 'title') final  SalesTitleEnumDto title;
@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'image_url') final  String imageUrl;

/// Create a copy of SalesMemberDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesMemberDtoCopyWith<_SalesMemberDto> get copyWith => __$SalesMemberDtoCopyWithImpl<_SalesMemberDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesMemberDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesMemberDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.age, age) || other.age == age)&&(identical(other.title, title) || other.title == title)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,gender,age,title,phoneNumber,description,imageUrl);

@override
String toString() {
  return 'SalesMemberDto(id: $id, name: $name, gender: $gender, age: $age, title: $title, phoneNumber: $phoneNumber, description: $description, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$SalesMemberDtoCopyWith<$Res> implements $SalesMemberDtoCopyWith<$Res> {
  factory _$SalesMemberDtoCopyWith(_SalesMemberDto value, $Res Function(_SalesMemberDto) _then) = __$SalesMemberDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'gender') String gender,@JsonKey(name: 'age') int age,@JsonKey(name: 'title') SalesTitleEnumDto title,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'description') String description,@JsonKey(name: 'image_url') String imageUrl
});




}
/// @nodoc
class __$SalesMemberDtoCopyWithImpl<$Res>
    implements _$SalesMemberDtoCopyWith<$Res> {
  __$SalesMemberDtoCopyWithImpl(this._self, this._then);

  final _SalesMemberDto _self;
  final $Res Function(_SalesMemberDto) _then;

/// Create a copy of SalesMemberDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? gender = null,Object? age = null,Object? title = null,Object? phoneNumber = null,Object? description = null,Object? imageUrl = null,}) {
  return _then(_SalesMemberDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as SalesTitleEnumDto,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
