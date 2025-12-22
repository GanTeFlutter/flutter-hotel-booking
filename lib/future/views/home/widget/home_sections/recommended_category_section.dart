// recommended_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/cart_detail/cart_detail_view.dart';
import 'package:flutter_hotel_booking/future/views/home/state/recommended_category_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/cattegory/category_chips.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/cattegory/hotel_section_card.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/shimmer/recommended_shimmer.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCategoryBloc, RecommendedCategoryState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Column(
            children: [
              const CategoryChipsShimmer(),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (_, _) => const SizedBox(height: 16),
                itemBuilder: (_, _) => const HotelSectionCardShimmer(),
              ),
            ],
          ),
          loaded: (hotels, selectedCategory) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryChips(selectedCategory: selectedCategory),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hotels.length > 4 ? 4 : hotels.length,
                separatorBuilder: (_, _) => const Divider(
                  height: 30,
                  color: Color(0xFFE9EBED),
                  thickness: 1.5,
                ),
                itemBuilder: (_, index) => HotelSectionCard(
                  hotel: hotels[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) =>
                            CardDetailView(hotel: hotels[index]),
                      ),
                    );
                  },
                ),
              ),
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
