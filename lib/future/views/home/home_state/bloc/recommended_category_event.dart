part of 'recommended_category_bloc.dart';

// Event
@freezed
class RecommendedCategoryEvent with _$RecommendedCategoryEvent {
  const factory RecommendedCategoryEvent.started() = _Started;

  const factory RecommendedCategoryEvent.changeCategory({
    HotelCategory? category,
  }) = _ChangeCategory;
}
