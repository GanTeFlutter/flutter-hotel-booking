import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  PageController? pageController;

  void setPage(int page) {
    emit(page);
  }

  void nextPage() {
    if (pageController?.hasClients ?? false) {
      final currentPage = state;
      if (currentPage < 2) {
        pageController?.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Future<void> close() {
    pageController = null;
    return super.close();
  }
}
