// category_chips.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/home_state/bloc/recommended_category_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/cattgory/category_chip.dart';
import 'package:gen/gen.dart';

final class CategoryChips extends StatelessWidget {
  const CategoryChips({required this.selectedCategory, super.key});

  final HotelCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          CategoryChip(
            label: 'All',
            isSelected: selectedCategory == null,
            onTap: () => context.read<RecommendedCategoryBloc>().add(
              const RecommendedCategoryEvent.changeCategory(),
            ),
          ),
          const SizedBox(width: 8),
          ...HotelCategory.values.map(
            (category) => CategoryChip(
              label: category.label,
              isSelected: selectedCategory == category,
              onTap: () => context.read<RecommendedCategoryBloc>().add(
                RecommendedCategoryEvent.changeCategory(category: category),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
