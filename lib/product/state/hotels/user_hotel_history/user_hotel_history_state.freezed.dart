// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_hotel_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserHotelHistoryState {

// 🔍 Recent Searches (string list)
 List<String> get recentSearches; HistoryStatus get recentSearchesStatus;// 👁 Recently Viewed Hotels
 List<Hotel> get recentlyViewed; HistoryStatus get recentlyViewedStatus;
/// Create a copy of UserHotelHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserHotelHistoryStateCopyWith<UserHotelHistoryState> get copyWith => _$UserHotelHistoryStateCopyWithImpl<UserHotelHistoryState>(this as UserHotelHistoryState, _$identity);

  /// Serializes this UserHotelHistoryState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserHotelHistoryState&&const DeepCollectionEquality().equals(other.recentSearches, recentSearches)&&(identical(other.recentSearchesStatus, recentSearchesStatus) || other.recentSearchesStatus == recentSearchesStatus)&&const DeepCollectionEquality().equals(other.recentlyViewed, recentlyViewed)&&(identical(other.recentlyViewedStatus, recentlyViewedStatus) || other.recentlyViewedStatus == recentlyViewedStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recentSearches),recentSearchesStatus,const DeepCollectionEquality().hash(recentlyViewed),recentlyViewedStatus);

@override
String toString() {
  return 'UserHotelHistoryState(recentSearches: $recentSearches, recentSearchesStatus: $recentSearchesStatus, recentlyViewed: $recentlyViewed, recentlyViewedStatus: $recentlyViewedStatus)';
}


}

/// @nodoc
abstract mixin class $UserHotelHistoryStateCopyWith<$Res>  {
  factory $UserHotelHistoryStateCopyWith(UserHotelHistoryState value, $Res Function(UserHotelHistoryState) _then) = _$UserHotelHistoryStateCopyWithImpl;
@useResult
$Res call({
 List<String> recentSearches, HistoryStatus recentSearchesStatus, List<Hotel> recentlyViewed, HistoryStatus recentlyViewedStatus
});




}
/// @nodoc
class _$UserHotelHistoryStateCopyWithImpl<$Res>
    implements $UserHotelHistoryStateCopyWith<$Res> {
  _$UserHotelHistoryStateCopyWithImpl(this._self, this._then);

  final UserHotelHistoryState _self;
  final $Res Function(UserHotelHistoryState) _then;

/// Create a copy of UserHotelHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recentSearches = null,Object? recentSearchesStatus = null,Object? recentlyViewed = null,Object? recentlyViewedStatus = null,}) {
  return _then(_self.copyWith(
recentSearches: null == recentSearches ? _self.recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,recentSearchesStatus: null == recentSearchesStatus ? _self.recentSearchesStatus : recentSearchesStatus // ignore: cast_nullable_to_non_nullable
as HistoryStatus,recentlyViewed: null == recentlyViewed ? _self.recentlyViewed : recentlyViewed // ignore: cast_nullable_to_non_nullable
as List<Hotel>,recentlyViewedStatus: null == recentlyViewedStatus ? _self.recentlyViewedStatus : recentlyViewedStatus // ignore: cast_nullable_to_non_nullable
as HistoryStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [UserHotelHistoryState].
extension UserHotelHistoryStatePatterns on UserHotelHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserHotelHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserHotelHistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserHotelHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _UserHotelHistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserHotelHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _UserHotelHistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> recentSearches,  HistoryStatus recentSearchesStatus,  List<Hotel> recentlyViewed,  HistoryStatus recentlyViewedStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserHotelHistoryState() when $default != null:
return $default(_that.recentSearches,_that.recentSearchesStatus,_that.recentlyViewed,_that.recentlyViewedStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> recentSearches,  HistoryStatus recentSearchesStatus,  List<Hotel> recentlyViewed,  HistoryStatus recentlyViewedStatus)  $default,) {final _that = this;
switch (_that) {
case _UserHotelHistoryState():
return $default(_that.recentSearches,_that.recentSearchesStatus,_that.recentlyViewed,_that.recentlyViewedStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> recentSearches,  HistoryStatus recentSearchesStatus,  List<Hotel> recentlyViewed,  HistoryStatus recentlyViewedStatus)?  $default,) {final _that = this;
switch (_that) {
case _UserHotelHistoryState() when $default != null:
return $default(_that.recentSearches,_that.recentSearchesStatus,_that.recentlyViewed,_that.recentlyViewedStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserHotelHistoryState implements UserHotelHistoryState {
  const _UserHotelHistoryState({final  List<String> recentSearches = const [], this.recentSearchesStatus = HistoryStatus.initial, final  List<Hotel> recentlyViewed = const [], this.recentlyViewedStatus = HistoryStatus.initial}): _recentSearches = recentSearches,_recentlyViewed = recentlyViewed;
  factory _UserHotelHistoryState.fromJson(Map<String, dynamic> json) => _$UserHotelHistoryStateFromJson(json);

// 🔍 Recent Searches (string list)
 final  List<String> _recentSearches;
// 🔍 Recent Searches (string list)
@override@JsonKey() List<String> get recentSearches {
  if (_recentSearches is EqualUnmodifiableListView) return _recentSearches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSearches);
}

@override@JsonKey() final  HistoryStatus recentSearchesStatus;
// 👁 Recently Viewed Hotels
 final  List<Hotel> _recentlyViewed;
// 👁 Recently Viewed Hotels
@override@JsonKey() List<Hotel> get recentlyViewed {
  if (_recentlyViewed is EqualUnmodifiableListView) return _recentlyViewed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentlyViewed);
}

@override@JsonKey() final  HistoryStatus recentlyViewedStatus;

/// Create a copy of UserHotelHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserHotelHistoryStateCopyWith<_UserHotelHistoryState> get copyWith => __$UserHotelHistoryStateCopyWithImpl<_UserHotelHistoryState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserHotelHistoryStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserHotelHistoryState&&const DeepCollectionEquality().equals(other._recentSearches, _recentSearches)&&(identical(other.recentSearchesStatus, recentSearchesStatus) || other.recentSearchesStatus == recentSearchesStatus)&&const DeepCollectionEquality().equals(other._recentlyViewed, _recentlyViewed)&&(identical(other.recentlyViewedStatus, recentlyViewedStatus) || other.recentlyViewedStatus == recentlyViewedStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recentSearches),recentSearchesStatus,const DeepCollectionEquality().hash(_recentlyViewed),recentlyViewedStatus);

@override
String toString() {
  return 'UserHotelHistoryState(recentSearches: $recentSearches, recentSearchesStatus: $recentSearchesStatus, recentlyViewed: $recentlyViewed, recentlyViewedStatus: $recentlyViewedStatus)';
}


}

/// @nodoc
abstract mixin class _$UserHotelHistoryStateCopyWith<$Res> implements $UserHotelHistoryStateCopyWith<$Res> {
  factory _$UserHotelHistoryStateCopyWith(_UserHotelHistoryState value, $Res Function(_UserHotelHistoryState) _then) = __$UserHotelHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> recentSearches, HistoryStatus recentSearchesStatus, List<Hotel> recentlyViewed, HistoryStatus recentlyViewedStatus
});




}
/// @nodoc
class __$UserHotelHistoryStateCopyWithImpl<$Res>
    implements _$UserHotelHistoryStateCopyWith<$Res> {
  __$UserHotelHistoryStateCopyWithImpl(this._self, this._then);

  final _UserHotelHistoryState _self;
  final $Res Function(_UserHotelHistoryState) _then;

/// Create a copy of UserHotelHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recentSearches = null,Object? recentSearchesStatus = null,Object? recentlyViewed = null,Object? recentlyViewedStatus = null,}) {
  return _then(_UserHotelHistoryState(
recentSearches: null == recentSearches ? _self._recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,recentSearchesStatus: null == recentSearchesStatus ? _self.recentSearchesStatus : recentSearchesStatus // ignore: cast_nullable_to_non_nullable
as HistoryStatus,recentlyViewed: null == recentlyViewed ? _self._recentlyViewed : recentlyViewed // ignore: cast_nullable_to_non_nullable
as List<Hotel>,recentlyViewedStatus: null == recentlyViewedStatus ? _self.recentlyViewedStatus : recentlyViewedStatus // ignore: cast_nullable_to_non_nullable
as HistoryStatus,
  ));
}


}

// dart format on
