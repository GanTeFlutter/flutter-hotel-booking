// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Hotel {

 String get id; String get name; String get description; List<String> get images; HotelLocation get location; double get averageRating; int get totalReviews; int get starRating; double get minPrice; List<Facility> get facilities; bool get isActive; DateTime get createdAt; HotelCategory? get category;
/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelCopyWith<Hotel> get copyWith => _$HotelCopyWithImpl<Hotel>(this as Hotel, _$identity);

  /// Serializes this Hotel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hotel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.location, location) || other.location == location)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.starRating, starRating) || other.starRating == starRating)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&const DeepCollectionEquality().equals(other.facilities, facilities)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(images),location,averageRating,totalReviews,starRating,minPrice,const DeepCollectionEquality().hash(facilities),isActive,createdAt,category);

@override
String toString() {
  return 'Hotel(id: $id, name: $name, description: $description, images: $images, location: $location, averageRating: $averageRating, totalReviews: $totalReviews, starRating: $starRating, minPrice: $minPrice, facilities: $facilities, isActive: $isActive, createdAt: $createdAt, category: $category)';
}


}

/// @nodoc
abstract mixin class $HotelCopyWith<$Res>  {
  factory $HotelCopyWith(Hotel value, $Res Function(Hotel) _then) = _$HotelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, List<String> images, HotelLocation location, double averageRating, int totalReviews, int starRating, double minPrice, List<Facility> facilities, bool isActive, DateTime createdAt, HotelCategory? category
});


$HotelLocationCopyWith<$Res> get location;

}
/// @nodoc
class _$HotelCopyWithImpl<$Res>
    implements $HotelCopyWith<$Res> {
  _$HotelCopyWithImpl(this._self, this._then);

  final Hotel _self;
  final $Res Function(Hotel) _then;

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? images = null,Object? location = null,Object? averageRating = null,Object? totalReviews = null,Object? starRating = null,Object? minPrice = null,Object? facilities = null,Object? isActive = null,Object? createdAt = null,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as HotelLocation,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,starRating: null == starRating ? _self.starRating : starRating // ignore: cast_nullable_to_non_nullable
as int,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double,facilities: null == facilities ? _self.facilities : facilities // ignore: cast_nullable_to_non_nullable
as List<Facility>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HotelCategory?,
  ));
}
/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelLocationCopyWith<$Res> get location {
  
  return $HotelLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [Hotel].
extension HotelPatterns on Hotel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hotel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hotel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hotel value)  $default,){
final _that = this;
switch (_that) {
case _Hotel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hotel value)?  $default,){
final _that = this;
switch (_that) {
case _Hotel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  List<String> images,  HotelLocation location,  double averageRating,  int totalReviews,  int starRating,  double minPrice,  List<Facility> facilities,  bool isActive,  DateTime createdAt,  HotelCategory? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.images,_that.location,_that.averageRating,_that.totalReviews,_that.starRating,_that.minPrice,_that.facilities,_that.isActive,_that.createdAt,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  List<String> images,  HotelLocation location,  double averageRating,  int totalReviews,  int starRating,  double minPrice,  List<Facility> facilities,  bool isActive,  DateTime createdAt,  HotelCategory? category)  $default,) {final _that = this;
switch (_that) {
case _Hotel():
return $default(_that.id,_that.name,_that.description,_that.images,_that.location,_that.averageRating,_that.totalReviews,_that.starRating,_that.minPrice,_that.facilities,_that.isActive,_that.createdAt,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  List<String> images,  HotelLocation location,  double averageRating,  int totalReviews,  int starRating,  double minPrice,  List<Facility> facilities,  bool isActive,  DateTime createdAt,  HotelCategory? category)?  $default,) {final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.images,_that.location,_that.averageRating,_that.totalReviews,_that.starRating,_that.minPrice,_that.facilities,_that.isActive,_that.createdAt,_that.category);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Hotel implements Hotel {
  const _Hotel({required this.id, required this.name, required this.description, required final  List<String> images, required this.location, required this.averageRating, required this.totalReviews, required this.starRating, required this.minPrice, required final  List<Facility> facilities, required this.isActive, required this.createdAt, required this.category}): _images = images,_facilities = facilities;
  factory _Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  HotelLocation location;
@override final  double averageRating;
@override final  int totalReviews;
@override final  int starRating;
@override final  double minPrice;
 final  List<Facility> _facilities;
@override List<Facility> get facilities {
  if (_facilities is EqualUnmodifiableListView) return _facilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_facilities);
}

@override final  bool isActive;
@override final  DateTime createdAt;
@override final  HotelCategory? category;

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelCopyWith<_Hotel> get copyWith => __$HotelCopyWithImpl<_Hotel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hotel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.location, location) || other.location == location)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.starRating, starRating) || other.starRating == starRating)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&const DeepCollectionEquality().equals(other._facilities, _facilities)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_images),location,averageRating,totalReviews,starRating,minPrice,const DeepCollectionEquality().hash(_facilities),isActive,createdAt,category);

@override
String toString() {
  return 'Hotel(id: $id, name: $name, description: $description, images: $images, location: $location, averageRating: $averageRating, totalReviews: $totalReviews, starRating: $starRating, minPrice: $minPrice, facilities: $facilities, isActive: $isActive, createdAt: $createdAt, category: $category)';
}


}

/// @nodoc
abstract mixin class _$HotelCopyWith<$Res> implements $HotelCopyWith<$Res> {
  factory _$HotelCopyWith(_Hotel value, $Res Function(_Hotel) _then) = __$HotelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, List<String> images, HotelLocation location, double averageRating, int totalReviews, int starRating, double minPrice, List<Facility> facilities, bool isActive, DateTime createdAt, HotelCategory? category
});


@override $HotelLocationCopyWith<$Res> get location;

}
/// @nodoc
class __$HotelCopyWithImpl<$Res>
    implements _$HotelCopyWith<$Res> {
  __$HotelCopyWithImpl(this._self, this._then);

  final _Hotel _self;
  final $Res Function(_Hotel) _then;

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? images = null,Object? location = null,Object? averageRating = null,Object? totalReviews = null,Object? starRating = null,Object? minPrice = null,Object? facilities = null,Object? isActive = null,Object? createdAt = null,Object? category = freezed,}) {
  return _then(_Hotel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as HotelLocation,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,starRating: null == starRating ? _self.starRating : starRating // ignore: cast_nullable_to_non_nullable
as int,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double,facilities: null == facilities ? _self._facilities : facilities // ignore: cast_nullable_to_non_nullable
as List<Facility>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HotelCategory?,
  ));
}

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelLocationCopyWith<$Res> get location {
  
  return $HotelLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
