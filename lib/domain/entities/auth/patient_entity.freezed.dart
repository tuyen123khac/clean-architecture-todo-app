// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PatientEntity {

 int get id; String get name; String get surname; String get email; String get dateOfBirth; GenderEnum get gender; int get heightInches; int get shoeSizeUs; ArchTypeEnumEntity get archType; String get podiatristName; String? get nextTestDate; bool get isProfileComplete; bool get forceChangePassword;
/// Create a copy of PatientEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientEntityCopyWith<PatientEntity> get copyWith => _$PatientEntityCopyWithImpl<PatientEntity>(this as PatientEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.email, email) || other.email == email)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.heightInches, heightInches) || other.heightInches == heightInches)&&(identical(other.shoeSizeUs, shoeSizeUs) || other.shoeSizeUs == shoeSizeUs)&&(identical(other.archType, archType) || other.archType == archType)&&(identical(other.podiatristName, podiatristName) || other.podiatristName == podiatristName)&&(identical(other.nextTestDate, nextTestDate) || other.nextTestDate == nextTestDate)&&(identical(other.isProfileComplete, isProfileComplete) || other.isProfileComplete == isProfileComplete)&&(identical(other.forceChangePassword, forceChangePassword) || other.forceChangePassword == forceChangePassword));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,surname,email,dateOfBirth,gender,heightInches,shoeSizeUs,archType,podiatristName,nextTestDate,isProfileComplete,forceChangePassword);

@override
String toString() {
  return 'PatientEntity(id: $id, name: $name, surname: $surname, email: $email, dateOfBirth: $dateOfBirth, gender: $gender, heightInches: $heightInches, shoeSizeUs: $shoeSizeUs, archType: $archType, podiatristName: $podiatristName, nextTestDate: $nextTestDate, isProfileComplete: $isProfileComplete, forceChangePassword: $forceChangePassword)';
}


}

/// @nodoc
abstract mixin class $PatientEntityCopyWith<$Res>  {
  factory $PatientEntityCopyWith(PatientEntity value, $Res Function(PatientEntity) _then) = _$PatientEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String surname, String email, String dateOfBirth, GenderEnum gender, int heightInches, int shoeSizeUs, ArchTypeEnumEntity archType, String podiatristName, String? nextTestDate, bool isProfileComplete, bool forceChangePassword
});




}
/// @nodoc
class _$PatientEntityCopyWithImpl<$Res>
    implements $PatientEntityCopyWith<$Res> {
  _$PatientEntityCopyWithImpl(this._self, this._then);

  final PatientEntity _self;
  final $Res Function(PatientEntity) _then;

/// Create a copy of PatientEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? surname = null,Object? email = null,Object? dateOfBirth = null,Object? gender = null,Object? heightInches = null,Object? shoeSizeUs = null,Object? archType = null,Object? podiatristName = null,Object? nextTestDate = freezed,Object? isProfileComplete = null,Object? forceChangePassword = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as GenderEnum,heightInches: null == heightInches ? _self.heightInches : heightInches // ignore: cast_nullable_to_non_nullable
as int,shoeSizeUs: null == shoeSizeUs ? _self.shoeSizeUs : shoeSizeUs // ignore: cast_nullable_to_non_nullable
as int,archType: null == archType ? _self.archType : archType // ignore: cast_nullable_to_non_nullable
as ArchTypeEnumEntity,podiatristName: null == podiatristName ? _self.podiatristName : podiatristName // ignore: cast_nullable_to_non_nullable
as String,nextTestDate: freezed == nextTestDate ? _self.nextTestDate : nextTestDate // ignore: cast_nullable_to_non_nullable
as String?,isProfileComplete: null == isProfileComplete ? _self.isProfileComplete : isProfileComplete // ignore: cast_nullable_to_non_nullable
as bool,forceChangePassword: null == forceChangePassword ? _self.forceChangePassword : forceChangePassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientEntity].
extension PatientEntityPatterns on PatientEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientEntity value)  $default,){
final _that = this;
switch (_that) {
case _PatientEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PatientEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String surname,  String email,  String dateOfBirth,  GenderEnum gender,  int heightInches,  int shoeSizeUs,  ArchTypeEnumEntity archType,  String podiatristName,  String? nextTestDate,  bool isProfileComplete,  bool forceChangePassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientEntity() when $default != null:
return $default(_that.id,_that.name,_that.surname,_that.email,_that.dateOfBirth,_that.gender,_that.heightInches,_that.shoeSizeUs,_that.archType,_that.podiatristName,_that.nextTestDate,_that.isProfileComplete,_that.forceChangePassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String surname,  String email,  String dateOfBirth,  GenderEnum gender,  int heightInches,  int shoeSizeUs,  ArchTypeEnumEntity archType,  String podiatristName,  String? nextTestDate,  bool isProfileComplete,  bool forceChangePassword)  $default,) {final _that = this;
switch (_that) {
case _PatientEntity():
return $default(_that.id,_that.name,_that.surname,_that.email,_that.dateOfBirth,_that.gender,_that.heightInches,_that.shoeSizeUs,_that.archType,_that.podiatristName,_that.nextTestDate,_that.isProfileComplete,_that.forceChangePassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String surname,  String email,  String dateOfBirth,  GenderEnum gender,  int heightInches,  int shoeSizeUs,  ArchTypeEnumEntity archType,  String podiatristName,  String? nextTestDate,  bool isProfileComplete,  bool forceChangePassword)?  $default,) {final _that = this;
switch (_that) {
case _PatientEntity() when $default != null:
return $default(_that.id,_that.name,_that.surname,_that.email,_that.dateOfBirth,_that.gender,_that.heightInches,_that.shoeSizeUs,_that.archType,_that.podiatristName,_that.nextTestDate,_that.isProfileComplete,_that.forceChangePassword);case _:
  return null;

}
}

}

/// @nodoc


class _PatientEntity extends PatientEntity {
  const _PatientEntity({required this.id, required this.name, required this.surname, required this.email, required this.dateOfBirth, required this.gender, required this.heightInches, required this.shoeSizeUs, required this.archType, required this.podiatristName, this.nextTestDate, required this.isProfileComplete, required this.forceChangePassword}): super._();
  

@override final  int id;
@override final  String name;
@override final  String surname;
@override final  String email;
@override final  String dateOfBirth;
@override final  GenderEnum gender;
@override final  int heightInches;
@override final  int shoeSizeUs;
@override final  ArchTypeEnumEntity archType;
@override final  String podiatristName;
@override final  String? nextTestDate;
@override final  bool isProfileComplete;
@override final  bool forceChangePassword;

/// Create a copy of PatientEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientEntityCopyWith<_PatientEntity> get copyWith => __$PatientEntityCopyWithImpl<_PatientEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.email, email) || other.email == email)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.heightInches, heightInches) || other.heightInches == heightInches)&&(identical(other.shoeSizeUs, shoeSizeUs) || other.shoeSizeUs == shoeSizeUs)&&(identical(other.archType, archType) || other.archType == archType)&&(identical(other.podiatristName, podiatristName) || other.podiatristName == podiatristName)&&(identical(other.nextTestDate, nextTestDate) || other.nextTestDate == nextTestDate)&&(identical(other.isProfileComplete, isProfileComplete) || other.isProfileComplete == isProfileComplete)&&(identical(other.forceChangePassword, forceChangePassword) || other.forceChangePassword == forceChangePassword));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,surname,email,dateOfBirth,gender,heightInches,shoeSizeUs,archType,podiatristName,nextTestDate,isProfileComplete,forceChangePassword);

@override
String toString() {
  return 'PatientEntity(id: $id, name: $name, surname: $surname, email: $email, dateOfBirth: $dateOfBirth, gender: $gender, heightInches: $heightInches, shoeSizeUs: $shoeSizeUs, archType: $archType, podiatristName: $podiatristName, nextTestDate: $nextTestDate, isProfileComplete: $isProfileComplete, forceChangePassword: $forceChangePassword)';
}


}

/// @nodoc
abstract mixin class _$PatientEntityCopyWith<$Res> implements $PatientEntityCopyWith<$Res> {
  factory _$PatientEntityCopyWith(_PatientEntity value, $Res Function(_PatientEntity) _then) = __$PatientEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String surname, String email, String dateOfBirth, GenderEnum gender, int heightInches, int shoeSizeUs, ArchTypeEnumEntity archType, String podiatristName, String? nextTestDate, bool isProfileComplete, bool forceChangePassword
});




}
/// @nodoc
class __$PatientEntityCopyWithImpl<$Res>
    implements _$PatientEntityCopyWith<$Res> {
  __$PatientEntityCopyWithImpl(this._self, this._then);

  final _PatientEntity _self;
  final $Res Function(_PatientEntity) _then;

/// Create a copy of PatientEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? surname = null,Object? email = null,Object? dateOfBirth = null,Object? gender = null,Object? heightInches = null,Object? shoeSizeUs = null,Object? archType = null,Object? podiatristName = null,Object? nextTestDate = freezed,Object? isProfileComplete = null,Object? forceChangePassword = null,}) {
  return _then(_PatientEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as GenderEnum,heightInches: null == heightInches ? _self.heightInches : heightInches // ignore: cast_nullable_to_non_nullable
as int,shoeSizeUs: null == shoeSizeUs ? _self.shoeSizeUs : shoeSizeUs // ignore: cast_nullable_to_non_nullable
as int,archType: null == archType ? _self.archType : archType // ignore: cast_nullable_to_non_nullable
as ArchTypeEnumEntity,podiatristName: null == podiatristName ? _self.podiatristName : podiatristName // ignore: cast_nullable_to_non_nullable
as String,nextTestDate: freezed == nextTestDate ? _self.nextTestDate : nextTestDate // ignore: cast_nullable_to_non_nullable
as String?,isProfileComplete: null == isProfileComplete ? _self.isProfileComplete : isProfileComplete // ignore: cast_nullable_to_non_nullable
as bool,forceChangePassword: null == forceChangePassword ? _self.forceChangePassword : forceChangePassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
