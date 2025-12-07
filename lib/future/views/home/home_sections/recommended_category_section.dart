// recommended_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/home_state/bloc/recommended_category_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/cattgory/category_chips.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/cattgory/hotel_list.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCategoryBloc, RecommendedCategoryState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (hotels, selectedCategory) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryChips(selectedCategory: selectedCategory),
              HotelList(hotels: hotels),
            ],
          ),
          failure: (errorMessage) => Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Text(errorMessage),
            ),
          ),
        );
      },
    );
  }
}
