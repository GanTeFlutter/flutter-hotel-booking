import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firebase_firestore/firebase_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gen/gen.dart';

part 'recommended_category_event.dart';
part 'recommended_category_state.dart';
part 'recommended_category_bloc.freezed.dart';

class RecommendedCategoryBloc
    extends Bloc<RecommendedCategoryEvent, RecommendedCategoryState> {
  RecommendedCategoryBloc({required FirebaseHotelService hotelService})
    : _hotelService = hotelService,
      super(const RecommendedCategoryState.initial()) {
    on<_Started>(_onStarted);
    on<_ChangeCategory>(_onChangeCategory);
  }

  final FirebaseHotelService _hotelService;
  List<Hotel> _allHotels = [];

  Future<void> _onStarted(
    _Started event,
    Emitter<RecommendedCategoryState> emit,
  ) async {
    emit(const RecommendedCategoryState.loading());

    try {
      _allHotels = await _hotelService.getHotels();

      emit(
        RecommendedCategoryState.loaded(
          hotels: _allHotels,
        ),
      );
    } on Exception catch (e) {
      emit(RecommendedCategoryState.failure(errorMessage: e.toString()));
    }
  }

  void _onChangeCategory(
    _ChangeCategory event,
    Emitter<RecommendedCategoryState> emit,
  ) {
    final filteredHotels = event.category == null
        ? _allHotels
        : _allHotels.where((h) => h.category == event.category).toList();

    emit(
      RecommendedCategoryState.loaded(
        hotels: filteredHotels,
        selectedCategory: event.category,
      ),
    );
  }
}
