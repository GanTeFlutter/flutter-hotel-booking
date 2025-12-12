// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_picks_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopPicksState _$TopPicksStateFromJson(
  Map<String, dynamic> json,
) => _TopPicksState(
  mostPopular:
      (json['mostPopular'] as List<dynamic>?)
          ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  mostPopularStatus:
      $enumDecodeNullable(_$TopPicksStatusEnumMap, json['mostPopularStatus']) ??
      TopPicksStatus.initial,
  bestToday:
      (json['bestToday'] as List<dynamic>?)
          ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  bestTodayStatus:
      $enumDecodeNullable(_$TopPicksStatusEnumMap, json['bestTodayStatus']) ??
      TopPicksStatus.initial,
);

Map<String, dynamic> _$TopPicksStateToJson(_TopPicksState instance) =>
    <String, dynamic>{
      'mostPopular': instance.mostPopular.map((e) => e.toJson()).toList(),
      'mostPopularStatus': _$TopPicksStatusEnumMap[instance.mostPopularStatus],
      'bestToday': instance.bestToday.map((e) => e.toJson()).toList(),
      'bestTodayStatus': _$TopPicksStatusEnumMap[instance.bestTodayStatus],
    };

const _$TopPicksStatusEnumMap = {
  TopPicksStatus.initial: 'initial',
  TopPicksStatus.loading: 'loading',
  TopPicksStatus.success: 'success',
  TopPicksStatus.failure: 'failure',
};
