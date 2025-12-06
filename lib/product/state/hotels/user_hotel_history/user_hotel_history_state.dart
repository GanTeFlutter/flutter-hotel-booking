import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gen/gen.dart';

part 'user_hotel_history_state.freezed.dart';
part 'user_hotel_history_state.g.dart';

enum HistoryStatus { initial, loading, success, failure }

@freezed
abstract class UserHotelHistoryState with _$UserHotelHistoryState {
  const factory UserHotelHistoryState({
    // 🔍 Recent Searches (string list)
    @Default([]) List<String> recentSearches,
    @Default(HistoryStatus.initial) HistoryStatus recentSearchesStatus,

    // 👁 Recently Viewed Hotels
    @Default([]) List<Hotel> recentlyViewed,
    @Default(HistoryStatus.initial) HistoryStatus recentlyViewedStatus,
  }) = _UserHotelHistoryState;

  factory UserHotelHistoryState.fromJson(Map<String, dynamic> json) =>
      _$UserHotelHistoryStateFromJson(json);
}
