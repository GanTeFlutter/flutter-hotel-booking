// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hotel_history_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserHotelHistoryState _$UserHotelHistoryStateFromJson(
  Map<String, dynamic> json,
) => _UserHotelHistoryState(
  recentSearches:
      (json['recentSearches'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  recentSearchesStatus:
      $enumDecodeNullable(
        _$HistoryStatusEnumMap,
        json['recentSearchesStatus'],
      ) ??
      HistoryStatus.initial,
  recentlyViewed:
      (json['recentlyViewed'] as List<dynamic>?)
          ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  recentlyViewedStatus:
      $enumDecodeNullable(
        _$HistoryStatusEnumMap,
        json['recentlyViewedStatus'],
      ) ??
      HistoryStatus.initial,
);

Map<String, dynamic> _$UserHotelHistoryStateToJson(
  _UserHotelHistoryState instance,
) => <String, dynamic>{
  'recentSearches': instance.recentSearches,
  'recentSearchesStatus': _$HistoryStatusEnumMap[instance.recentSearchesStatus],
  'recentlyViewed': instance.recentlyViewed,
  'recentlyViewedStatus': _$HistoryStatusEnumMap[instance.recentlyViewedStatus],
};

const _$HistoryStatusEnumMap = {
  HistoryStatus.initial: 'initial',
  HistoryStatus.loading: 'loading',
  HistoryStatus.success: 'success',
  HistoryStatus.failure: 'failure',
};
