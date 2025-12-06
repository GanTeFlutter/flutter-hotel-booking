import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'recommended_category_state.dart';

class RecommendedCategoryCubit extends Cubit<RecommendedCategoryState> {
  RecommendedCategoryCubit() : super(RecommendedCategoryInitial());
}
