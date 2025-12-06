import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/state/hotels/top_picks/top_picks_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TopPicksCubit extends HydratedCubit<TopPicksState> {
  TopPicksCubit() : super(const TopPicksState());
  DateTime? _lastRefresh;
  static const _minRefreshInterval = Duration(seconds: 15);

  @override
  TopPicksState? fromJson(Map<String, dynamic> json) {
    return TopPicksState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TopPicksState state) {
    return state.toJson();
  }

  Future<void> loadTopPicks() async {
    final now = DateTime.now();

    if (_lastRefresh != null &&
        now.difference(_lastRefresh!) < _minRefreshInterval) {
      return;
    }

    _lastRefresh = now;

    await Future.wait([
      loadMostPopular(),
      loadBestToday(),
    ]);
  }

  Future<void> loadMostPopular() async {
    emit(
      state.copyWith(
        mostPopularStatus: TopPicksStatus.loading,
      ),
    );

    try {
      final hotels = await locator.firebaseHotelService.getHotels();

      emit(
        state.copyWith(
          mostPopular: hotels,
          mostPopularStatus: TopPicksStatus.success,
        ),
      );
    } on Exception catch (_) {
      emit(
        state.copyWith(
          mostPopularStatus: TopPicksStatus.failure,
        ),
      );
    }
  }

  Future<void> loadBestToday() async {
    emit(
      state.copyWith(
        bestTodayStatus: TopPicksStatus.loading,
      ),
    );

    try {
      final hotels = await locator.firebaseHotelService.getHotels();

      emit(
        state.copyWith(
          bestToday: hotels,
          bestTodayStatus: TopPicksStatus.success,
        ),
      );
    } on Exception catch (_) {
      emit(
        state.copyWith(
          bestTodayStatus: TopPicksStatus.failure,
        ),
      );
    }
  }
}
