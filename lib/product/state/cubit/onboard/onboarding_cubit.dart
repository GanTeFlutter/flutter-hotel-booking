import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void changePage(int pageIndex) {
    debugPrint('--OnboardingCubit changePage');
    emit(pageIndex);
  }

  void nextPage() {
    debugPrint('--OnboardingCubit nextPage');
    if (state < 2) {
      emit(state + 1);
    }
  }

  void previousPage() {
    if (state > 0) {
      emit(state - 1);
    }
  }

  void skipToEnd() {
    emit(2);
  }

  bool get isLastPage => state == 2;
  bool get isFirstPage => state == 0;
}
