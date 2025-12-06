

import 'package:flutter_hotel_booking/product/state/hotels/user_hotel_history/user_hotel_history_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class UserHotelHistoryCubit extends HydratedCubit<UserHotelHistoryState> {
  UserHotelHistoryCubit() : super(const UserHotelHistoryState());

  @override
  UserHotelHistoryState? fromJson(Map<String, dynamic> json) {
    return UserHotelHistoryState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserHotelHistoryState state) {
    return state.toJson();
  }

  Future<void> loadUserHotelHistory() async {
    await Future.wait([recentSearch(), recentlyViewed()]);
  }

  Future<void> recentSearch() async {
    emit(state.copyWith(recentSearchesStatus: HistoryStatus.loading));
  }

  Future<void> recentlyViewed() async {
    emit(state.copyWith(recentlyViewedStatus: HistoryStatus.loading));
  }
}
