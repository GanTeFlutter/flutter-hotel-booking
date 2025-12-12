import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/hotel_card_widget.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/shimmer/hotel_card_shimmer.dart';
import 'package:flutter_hotel_booking/product/state/hotels/top_picks/top_picks_cubit.dart';
import 'package:flutter_hotel_booking/product/state/hotels/top_picks/top_picks_state.dart';

final class MostPopularHotelCard extends StatelessWidget {
  const MostPopularHotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.3;

    return BlocBuilder<TopPicksCubit, TopPicksState>(
      buildWhen: (prev, curr) =>
          prev.mostPopular != curr.mostPopular ||
          prev.mostPopularStatus != curr.mostPopularStatus,
      builder: (context, state) {
        return switch (state.mostPopularStatus) {
          TopPicksStatus.loading => SizedBox(
            height: height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: index == 2 ? 0 : 16),
                child: const HotelCardShimmer(),
              ),
            ),
          ),
          TopPicksStatus.failure => SizedBox(
            height: height,
            child: const Center(child: Text('Bir hata oluştu')),
          ),
          _ when state.mostPopular.isEmpty => SizedBox(
            height: height,
            child: const Center(child: Text('Otel bulunamadı')),
          ),
          _ => SizedBox(
            height: height,
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: state.mostPopular.length,
              itemBuilder: (context, index) {
                final hotel = state.mostPopular[index];
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == state.mostPopular.length - 1 ? 0 : 16,
                  ),
                  child: HotelCard(
                    hotel: hotel,
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        };
      },
    );
  }
}
