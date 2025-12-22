part of 'recommended_category_bloc.dart';

// State - sadeleştirilmiş
@freezed
class RecommendedCategoryState with _$RecommendedCategoryState {
  const factory RecommendedCategoryState.initial() = _Initial;

  const factory RecommendedCategoryState.loading() = _Loading;

  const factory RecommendedCategoryState.loaded({
    required List<Hotel> hotels,
    HotelCategory? selectedCategory,
  }) = _Loaded;

  const factory RecommendedCategoryState.failure({
    required String errorMessage,
  }) = _Failure;
}
