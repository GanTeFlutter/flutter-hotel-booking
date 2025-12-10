import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/home_state/bloc/recommended_category_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/cattegory/category_chip.dart';
import 'package:gen/gen.dart';

final class CategoryChips extends StatelessWidget {
  const CategoryChips({required this.selectedCategory, super.key});

  final HotelCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
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
          CategoryChip(
            label: HotelCategory.hotels.label,
            imagePath: 'assets/hotel.png',
            isSelected: selectedCategory == HotelCategory.hotels,
            onTap: () => context.read<RecommendedCategoryBloc>().add(
              const RecommendedCategoryEvent.changeCategory(
                category: HotelCategory.hotels,
              ),
            ),
          ),
          CategoryChip(
            label: HotelCategory.villas.label,
            imagePath: 'assets/villa.png',
            isSelected: selectedCategory == HotelCategory.villas,
            onTap: () => context.read<RecommendedCategoryBloc>().add(
              const RecommendedCategoryEvent.changeCategory(
                category: HotelCategory.villas,
              ),
            ),
          ),
          CategoryChip(
            label: HotelCategory.apartment.label,
            imagePath: 'assets/apartmant.png',
            isSelected: selectedCategory == HotelCategory.apartment,
            onTap: () => context.read<RecommendedCategoryBloc>().add(
              const RecommendedCategoryEvent.changeCategory(
                category: HotelCategory.apartment,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
