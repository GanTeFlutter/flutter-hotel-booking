// hotel_list.dart
import 'package:flutter/material.dart';

import 'package:flutter_hotel_booking/future/views/home/widget/cattgory/hotel_category_card.dart';
import 'package:gen/gen.dart';

class HotelList extends StatelessWidget {
  const HotelList({required this.hotels, super.key});

  final List<Hotel> hotels;

  @override
  Widget build(BuildContext context) {
    if (hotels.isEmpty) {
      return const Center(
        child: Text('No hotels found'),
      );
    }

    // hotel_list.dart
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: hotels.length > 3 ? 3 : hotels.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) => HotelCard(hotel: hotels[index]),
    );
  }
}
