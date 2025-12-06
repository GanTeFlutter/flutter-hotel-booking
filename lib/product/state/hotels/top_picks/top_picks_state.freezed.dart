// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_picks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopPicksState {

 List<Hotel> get mostPopular; TopPicksStatus get mostPopularStatus; List<Hotel> get bestToday; TopPicksStatus get bestTodayStatus;
/// Create a copy of TopPicksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopPicksStateCopyWith<TopPicksState> get copyWith => _$TopPicksStateCopyWithImpl<TopPicksState>(this as TopPicksState, _$identity);

  /// Serializes this TopPicksState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopPicksState&&const DeepCollectionEquality().equals(other.mostPopular, mostPopular)&&(identical(other.mostPopularStatus, mostPopularStatus) || other.mostPopularStatus == mostPopularStatus)&&const DeepCollectionEquality().equals(other.bestToday, bestToday)&&(identical(other.bestTodayStatus, bestTodayStatus) || other.bestTodayStatus == bestTodayStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(mostPopular),mostPopularStatus,const DeepCollectionEquality().hash(bestToday),bestTodayStatus);

@override
String toString() {
  return 'TopPicksState(mostPopular: $mostPopular, mostPopularStatus: $mostPopularStatus, bestToday: $bestToday, bestTodayStatus: $bestTodayStatus)';
}


}

/// @nodoc
abstract mixin class $TopPicksStateCopyWith<$Res>  {
  factory $TopPicksStateCopyWith(TopPicksState value, $Res Function(TopPicksState) _then) = _$TopPicksStateCopyWithImpl;
@useResult
$Res call({
 List<Hotel> mostPopular, TopPicksStatus mostPopularStatus, List<Hotel> bestToday, TopPicksStatus bestTodayStatus
});




}
/// @nodoc
class _$TopPicksStateCopyWithImpl<$Res>
    implements $TopPicksStateCopyWith<$Res> {
  _$TopPicksStateCopyWithImpl(this._self, this._then);

  final TopPicksState _self;
  final $Res Function(TopPicksState) _then;

/// Create a copy of TopPicksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mostPopular = null,Object? mostPopularStatus = null,Object? bestToday = null,Object? bestTodayStatus = null,}) {
  return _then(_self.copyWith(
mostPopular: null == mostPopular ? _self.mostPopular : mostPopular // ignore: cast_nullable_to_non_nullable
as List<Hotel>,mostPopularStatus: null == mostPopularStatus ? _self.mostPopularStatus : mostPopularStatus // ignore: cast_nullable_to_non_nullable
as TopPicksStatus,bestToday: null == bestToday ? _self.bestToday : bestToday // ignore: cast_nullable_to_non_nullable
as List<Hotel>,bestTodayStatus: null == bestTodayStatus ? _self.bestTodayStatus : bestTodayStatus // ignore: cast_nullable_to_non_nullable
as TopPicksStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [TopPicksState].
extension TopPicksStatePatterns on TopPicksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopPicksState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopPicksState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopPicksState value)  $default,){
final _that = this;
switch (_that) {
case _TopPicksState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopPicksState value)?  $default,){
final _that = this;
switch (_that) {
case _TopPicksState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Hotel> mostPopular,  TopPicksStatus mostPopularStatus,  List<Hotel> bestToday,  TopPicksStatus bestTodayStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopPicksState() when $default != null:
return $default(_that.mostPopular,_that.mostPopularStatus,_that.bestToday,_that.bestTodayStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Hotel> mostPopular,  TopPicksStatus mostPopularStatus,  List<Hotel> bestToday,  TopPicksStatus bestTodayStatus)  $default,) {final _that = this;
switch (_that) {
case _TopPicksState():
return $default(_that.mostPopular,_that.mostPopularStatus,_that.bestToday,_that.bestTodayStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Hotel> mostPopular,  TopPicksStatus mostPopularStatus,  List<Hotel> bestToday,  TopPicksStatus bestTodayStatus)?  $default,) {final _that = this;
switch (_that) {
case _TopPicksState() when $default != null:
return $default(_that.mostPopular,_that.mostPopularStatus,_that.bestToday,_that.bestTodayStatus);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _TopPicksState implements TopPicksState {
  const _TopPicksState({final  List<Hotel> mostPopular = const [], this.mostPopularStatus = TopPicksStatus.initial, final  List<Hotel> bestToday = const [], this.bestTodayStatus = TopPicksStatus.initial}): _mostPopular = mostPopular,_bestToday = bestToday;
  factory _TopPicksState.fromJson(Map<String, dynamic> json) => _$TopPicksStateFromJson(json);

 final  List<Hotel> _mostPopular;
@override@JsonKey() List<Hotel> get mostPopular {
  if (_mostPopular is EqualUnmodifiableListView) return _mostPopular;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mostPopular);
}

@override@JsonKey() final  TopPicksStatus mostPopularStatus;
 final  List<Hotel> _bestToday;
@override@JsonKey() List<Hotel> get bestToday {
  if (_bestToday is EqualUnmodifiableListView) return _bestToday;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestToday);
}

@override@JsonKey() final  TopPicksStatus bestTodayStatus;

/// Create a copy of TopPicksState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopPicksStateCopyWith<_TopPicksState> get copyWith => __$TopPicksStateCopyWithImpl<_TopPicksState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopPicksStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopPicksState&&const DeepCollectionEquality().equals(other._mostPopular, _mostPopular)&&(identical(other.mostPopularStatus, mostPopularStatus) || other.mostPopularStatus == mostPopularStatus)&&const DeepCollectionEquality().equals(other._bestToday, _bestToday)&&(identical(other.bestTodayStatus, bestTodayStatus) || other.bestTodayStatus == bestTodayStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_mostPopular),mostPopularStatus,const DeepCollectionEquality().hash(_bestToday),bestTodayStatus);

@override
String toString() {
  return 'TopPicksState(mostPopular: $mostPopular, mostPopularStatus: $mostPopularStatus, bestToday: $bestToday, bestTodayStatus: $bestTodayStatus)';
}


}

/// @nodoc
abstract mixin class _$TopPicksStateCopyWith<$Res> implements $TopPicksStateCopyWith<$Res> {
  factory _$TopPicksStateCopyWith(_TopPicksState value, $Res Function(_TopPicksState) _then) = __$TopPicksStateCopyWithImpl;
@override @useResult
$Res call({
 List<Hotel> mostPopular, TopPicksStatus mostPopularStatus, List<Hotel> bestToday, TopPicksStatus bestTodayStatus
});




}
/// @nodoc
class __$TopPicksStateCopyWithImpl<$Res>
    implements _$TopPicksStateCopyWith<$Res> {
  __$TopPicksStateCopyWithImpl(this._self, this._then);

  final _TopPicksState _self;
  final $Res Function(_TopPicksState) _then;

/// Create a copy of TopPicksState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mostPopular = null,Object? mostPopularStatus = null,Object? bestToday = null,Object? bestTodayStatus = null,}) {
  return _then(_TopPicksState(
mostPopular: null == mostPopular ? _self._mostPopular : mostPopular // ignore: cast_nullable_to_non_nullable
as List<Hotel>,mostPopularStatus: null == mostPopularStatus ? _self.mostPopularStatus : mostPopularStatus // ignore: cast_nullable_to_non_nullable
as TopPicksStatus,bestToday: null == bestToday ? _self._bestToday : bestToday // ignore: cast_nullable_to_non_nullable
as List<Hotel>,bestTodayStatus: null == bestTodayStatus ? _self.bestTodayStatus : bestTodayStatus // ignore: cast_nullable_to_non_nullable
as TopPicksStatus,
  ));
}


}

// dart format on
