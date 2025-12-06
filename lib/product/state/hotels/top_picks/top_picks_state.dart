import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gen/gen.dart';

part 'top_picks_state.freezed.dart';
part 'top_picks_state.g.dart';

enum TopPicksStatus { initial, loading, success, failure }

@freezed
abstract class TopPicksState with _$TopPicksState {
  @JsonSerializable(explicitToJson: true)
  const factory TopPicksState({
    @Default([]) List<Hotel> mostPopular,
    @Default(TopPicksStatus.initial) TopPicksStatus mostPopularStatus,

    @Default([]) List<Hotel> bestToday,
    @Default(TopPicksStatus.initial) TopPicksStatus bestTodayStatus,
  }) = _TopPicksState;

  factory TopPicksState.fromJson(Map<String, dynamic> json) =>
      _$TopPicksStateFromJson(json);
}
