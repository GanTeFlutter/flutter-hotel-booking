import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/design/app_shadow.dart';
import 'package:flutter_hotel_booking/product/widget/project_network_image.dart';
import 'package:gen/gen.dart';

final class HotelSectionCard extends StatefulWidget {
  const HotelSectionCard({
    required this.hotel,
    super.key,
    this.onTap,
  });
  final Hotel hotel;

  final VoidCallback? onTap;

  @override
  State<HotelSectionCard> createState() => _HotelSectionCardState();
}

class _HotelSectionCardState extends State<HotelSectionCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),

        decoration: _cardDecoration,
        child: AnimatedScale(
          scale: _isPressed ? 0.97 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: SizedBox(
            height: 100,
            child: Stack(
              children: [
                Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(),
                    _buildContent(),
                  ],
                ),
                _buildRating(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ========== Decoration ==========
  BoxDecoration get _cardDecoration => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: _isPressed
        ? [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ]
        : [],
  );

  Widget _buildImage() {
    return Container(
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

          child: ProjectNetworkImage(
            boxFit: BoxFit.cover,
            url: widget.hotel.images.first,
          ),
        ),
      ),
    );
  }

  // ========== Content ==========
  Widget _buildContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildName(), _buildLocation(), _buildPrice()],
      ),
    );
  }

  // ========== Title ==========
  Widget _buildName() {
    return Text(
      widget.hotel.name,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 17,
        shadows: AppShadows.light3,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  // ========== Location ==========
  Widget _buildLocation() {
    return Row(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/solar_map-point-outline.png',
          width: 16,
          height: 16,
        ),
        Text(
          widget.hotel.location.address,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  // ========== Price ==========
  Widget _buildPrice() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '\$${widget.hotel.minPrice}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: ColorName.primary800,
              fontWeight: FontWeight.w500,
              fontSize: 19,
              shadows: AppShadows.light2,
            ),
          ),
          TextSpan(
            text: ' /night',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              shadows: AppShadows.light2,
            ),
          ),
        ],
      ),
    );
  }

  // ========== Rating ==========
  Widget _buildRating() {
    return Positioned(
      right: 0,
      top: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/solar_star-bold.png', width: 17, height: 17),
          const SizedBox(width: 4),
          Text(
            widget.hotel.averageRating.toStringAsFixed(1),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              shadows: AppShadows.light2,
            ),
          ),
        ],
      ),
    );
  }
}
