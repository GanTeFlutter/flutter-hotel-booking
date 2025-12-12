import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hotel_booking/future/views/home/widget/shimmer/hotel_card_shimmer.dart';
import 'package:flutter_hotel_booking/product/constant/design/app_shadow.dart';

import 'package:flutter_hotel_booking/product/state/hotels/top_picks/top_picks_cubit.dart';
import 'package:flutter_hotel_booking/product/state/hotels/top_picks/top_picks_state.dart';
import 'package:flutter_hotel_booking/product/widget/project_network_image.dart';
import 'package:gen/gen.dart';

final class BestTodayCard extends StatelessWidget {
  const BestTodayCard({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 140;

    return BlocBuilder<TopPicksCubit, TopPicksState>(
      builder: (context, state) {
        switch (state.bestTodayStatus) {
          case TopPicksStatus.initial:
          case TopPicksStatus.loading:
            return const SizedBox(
              height: cardHeight,
              child: HotelCardShimmer(),
            );
          case TopPicksStatus.success:
            return SizedBox(
              height: cardHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final hotel = state.bestToday[index];
                  return BestTodayHotelCard(hotel: hotel);
                },
                itemCount: state.bestToday.length,
              ),
            );
          case TopPicksStatus.failure:
            return SizedBox(
              height: cardHeight,
              child: Center(
                child: Text(
                  'Failed to load best today hotels.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
        }
      },
    );
  }
}

class BestTodayHotelCard extends StatefulWidget {
  const BestTodayHotelCard({required this.hotel, super.key});

  final Hotel hotel;

  @override
  State<BestTodayHotelCard> createState() => _BestTodayHotelCardState();
}

class _BestTodayHotelCardState extends State<BestTodayHotelCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {},
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.grey.withValues(alpha: _isPressed ? 0.3 : 0.2),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _isPressed ? 0.04 : 0.08),
                blurRadius: _isPressed ? 2 : 5,
                offset: Offset(0, _isPressed ? 1 : 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: ProjectNetworkImage(url: widget.hotel.images.first),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.hotel.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      shadows: AppShadows.light3,
                    ),
                  ),
                  const ImageIconTextWidget2(
                    imagePath: 'assets/solar_map-point-outline.png',
                    data: 'Santa Monica, CA...',
                    comments: false,
                  ),
                  Row(
                    children: [
                      ImageIconTextWidget(
                        imagePath: 'assets/solar_star-bold.png',
                        data: widget.hotel.averageRating.toStringAsFixed(1),
                        comments: true,
                        commentsNumber: '(523)',
                      ),
                      const SizedBox(width: 10),
                      Text(
                        r'$120',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        r'$199',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffF41F52),
                              decoration: TextDecoration.lineThrough,
                              decorationColor: const Color(0xffF41F52),
                              fontSize: 17,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageIconTextWidget extends StatelessWidget {
  const ImageIconTextWidget({
    required this.imagePath,
    required this.data,
    required this.comments,
    this.commentsNumber,
    super.key,
  });

  final String imagePath;
  final String data;
  final bool comments;
  final String? commentsNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 2),
        Text(
          data,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: const Color(0xffEDB900),
          ),
        ),
        if (comments) ...[
          const SizedBox(width: 2),
          Text(
            commentsNumber ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ],
    );
  }
}

class ImageIconTextWidget2 extends StatelessWidget {
  const ImageIconTextWidget2({
    required this.imagePath,
    required this.data,
    required this.comments,
    this.commentsNumber,
    super.key,
  });

  final String imagePath;
  final String data;
  final bool comments;
  final String? commentsNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            data,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (comments) ...[
          const SizedBox(width: 2),
          Text(
            commentsNumber ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ],
    );
  }
}
