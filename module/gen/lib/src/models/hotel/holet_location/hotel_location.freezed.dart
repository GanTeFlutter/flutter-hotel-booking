// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotelLocation {

 String get address; String get city; String get country; double get lat; double get lng;
/// Create a copy of HotelLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelLocationCopyWith<HotelLocation> get copyWith => _$HotelLocationCopyWithImpl<HotelLocation>(this as HotelLocation, _$identity);

  /// Serializes this HotelLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelLocation&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,city,country,lat,lng);

@override
String toString() {
  return 'HotelLocation(address: $address, city: $city, country: $country, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $HotelLocationCopyWith<$Res>  {
  factory $HotelLocationCopyWith(HotelLocation value, $Res Function(HotelLocation) _then) = _$HotelLocationCopyWithImpl;
@useResult
$Res call({
 String address, String city, String country, double lat, double lng
});




}
/// @nodoc
class _$HotelLocationCopyWithImpl<$Res>
    implements $HotelLocationCopyWith<$Res> {
  _$HotelLocationCopyWithImpl(this._self, this._then);

  final HotelLocation _self;
  final $Res Function(HotelLocation) _then;

/// Create a copy of HotelLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? city = null,Object? country = null,Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelLocation].
extension HotelLocationPatterns on HotelLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelLocation value)  $default,){
final _that = this;
switch (_that) {
case _HotelLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelLocation value)?  $default,){
final _that = this;
switch (_that) {
case _HotelLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  String city,  String country,  double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelLocation() when $default != null:
return $default(_that.address,_that.city,_that.country,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  String city,  String country,  double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _HotelLocation():
return $default(_that.address,_that.city,_that.country,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  String city,  String country,  double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _HotelLocation() when $default != null:
return $default(_that.address,_that.city,_that.country,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelLocation implements HotelLocation {
  const _HotelLocation({required this.address, required this.city, required this.country, required this.lat, required this.lng});
  factory _HotelLocation.fromJson(Map<String, dynamic> json) => _$HotelLocationFromJson(json);

@override final  String address;
@override final  String city;
@override final  String country;
@override final  double lat;
@override final  double lng;

/// Create a copy of HotelLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelLocationCopyWith<_HotelLocation> get copyWith => __$HotelLocationCopyWithImpl<_HotelLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelLocation&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,city,country,lat,lng);

@override
String toString() {
  return 'HotelLocation(address: $address, city: $city, country: $country, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$HotelLocationCopyWith<$Res> implements $HotelLocationCopyWith<$Res> {
  factory _$HotelLocationCopyWith(_HotelLocation value, $Res Function(_HotelLocation) _then) = __$HotelLocationCopyWithImpl;
@override @useResult
$Res call({
 String address, String city, String country, double lat, double lng
});




}
/// @nodoc
class __$HotelLocationCopyWithImpl<$Res>
    implements _$HotelLocationCopyWith<$Res> {
  __$HotelLocationCopyWithImpl(this._self, this._then);

  final _HotelLocation _self;
  final $Res Function(_HotelLocation) _then;

/// Create a copy of HotelLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? city = null,Object? country = null,Object? lat = null,Object? lng = null,}) {
  return _then(_HotelLocation(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
