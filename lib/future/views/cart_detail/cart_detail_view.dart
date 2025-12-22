import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/home_sections/best_popular_section.dart';
import 'package:flutter_hotel_booking/future/views/map/map_view.dart';
import 'package:flutter_hotel_booking/product/widget/project_network_image.dart';
import 'package:gen/gen.dart';

final class CardDetailView extends StatefulWidget {
  const CardDetailView({required this.hotel, super.key});

  final Hotel hotel;

  @override
  State<CardDetailView> createState() => _CardDetailViewState();
}

class _CardDetailViewState extends State<CardDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          _buildHotelDetails(context),
        ],
      ),
    );
  }

  // ============================================================================
  // SLIVER APP BAR WITH IMAGE
  // ============================================================================

  Widget _buildSliverAppBar(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.45,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: ProjectNetworkImage(
          url: widget.hotel.images.first,
          boxFit: BoxFit.cover,
          size: Size(size.width, size.height * 0.45),
        ),
      ),
    );
  }

  // ============================================================================
  // HOTEL DETAILS - SLIVER LIST
  // ============================================================================

  Widget _buildHotelDetails(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              _HotelHeader(hotel: widget.hotel),
              const SizedBox(height: 10),
              _FacilitiesSection(facilities: widget.hotel.facilities),
              const SizedBox(height: 10),
              _DescriptionSection(description: widget.hotel.description),
              const SizedBox(height: 10),
              _LocationSection(hotel: widget.hotel),
              const SizedBox(height: 10),
              const _ReviewsSection(),
              const SizedBox(height: 10),
              _RecommendationSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// HOTEL HEADER
// ============================================================================

class _HotelHeader extends StatelessWidget {
  const _HotelHeader({required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hotel.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _HotelInfoRow(hotel: hotel),
            ],
          ),
        ),
        _RoomViewButton(),
      ],
    );
  }
}

class _HotelInfoRow extends StatelessWidget {
  const _HotelInfoRow({required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Image.asset('assets/map_blue.png', width: 16, height: 16),
        const SizedBox(width: 2),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 150),
          child: Text(
            hotel.location.address,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorName.greyscale2,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const SizedBox(width: 4),
        Image.asset('assets/solar_star-bold.png', width: 16, height: 16),
        const SizedBox(width: 2),
        Text(
          hotel.averageRating.toStringAsFixed(1),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '(${hotel.totalReviews} reviews)',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: ColorName.greyscale2),
        ),
      ],
    );
  }
}

class _RoomViewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(
        'assets/seetheroom.png',
        width: 40,
        height: 40,
      ),
    );
  }
}

// ============================================================================
// FACILITIES SECTION
// ============================================================================

class _FacilitiesSection extends StatelessWidget {
  const _FacilitiesSection({required this.facilities});

  final List<Facility> facilities;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Common Facilities',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: facilities.map((f) => _FacilityChip(facility: f)).toList(),
        ),
      ],
    );
  }
}

class _FacilityChip extends StatelessWidget {
  const _FacilityChip({required this.facility});

  final Facility facility;

  IconData _getFacilityIcon() {
    final name = facility.name.toLowerCase();
    if (name.contains('wifi') || name.contains('internet')) return Icons.wifi;
    if (name.contains('pool') || name.contains('swimming')) return Icons.pool;
    if (name.contains('parking')) return Icons.local_parking;
    if (name.contains('gym') || name.contains('fitness')) {
      return Icons.fitness_center;
    }
    if (name.contains('restaurant') || name.contains('dining')) {
      return Icons.restaurant;
    }
    if (name.contains('spa')) return Icons.spa;
    if (name.contains('bar')) return Icons.local_bar;
    if (name.contains('room service')) return Icons.room_service;
    if (name.contains('laundry')) return Icons.local_laundry_service;
    if (name.contains('air') || name.contains('ac')) return Icons.ac_unit;
    if (name.contains('tv') || name.contains('television')) return Icons.tv;
    if (name.contains('pet')) return Icons.pets;
    if (name.contains('airport')) return Icons.flight;
    if (name.contains('beach')) return Icons.beach_access;
    return Icons.check_circle_outline;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getFacilityIcon(), size: 18, color: Colors.blue.shade700),
          const SizedBox(width: 8),
          Text(
            facility.name,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// DESCRIPTION SECTION
// ============================================================================

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        InlineReadMoreText(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// LOCATION SECTION
// ============================================================================

class _LocationSection extends StatelessWidget {
  const _LocationSection({required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _SectionHeader(title: 'Location', actionText: 'Open Map'),
        const SizedBox(height: 10),
        _LocationCard(address: hotel.location.address),
      ],
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          _MapPreview(),
          const SizedBox(height: 10),
          _AddressRow(address: address),
        ],
      ),
    );
  }
}

class _MapPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (_) => const MapView()),
          );
        },
        child: Container(
          width: double.infinity,
          height: 175,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/maspdoas.png'),
            ),
          ),
        ),
      ),
    );
  }
}

class _AddressRow extends StatelessWidget {
  const _AddressRow({required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/map_blue.png', width: 16, height: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            address,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: ColorName.greyscale2),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// REVIEWS SECTION
// ============================================================================

class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _SectionHeader(title: 'Reviews', actionText: 'See All'),
        SizedBox(height: 12),
        _ReviewCard(
          name: 'John Doe',
          rating: '4.5',
          comment:
              'Great stay, very comfortable and clean rooms. Highly recommend!',
          avatarUrl: 'https://i.pravatar.cc/150?img=12',
        ),
        SizedBox(height: 20),
        _ReviewCard(
          name: 'Alice Smith',
          rating: '5.0',
          comment:
              'The view from the balcony was breathtaking. I will definitely come back next summer!',
          avatarUrl: 'https://i.pravatar.cc/150?img=5',
        ),
        SizedBox(height: 20),
        _ReviewCard(
          name: 'Michael Brown',
          rating: '3.8',
          comment:
              'Staff was very helpful, but the Wi-Fi connection in the room was a bit weak.',
          avatarUrl: 'https://i.pravatar.cc/150?img=8',
        ),
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({
    required this.name,
    required this.rating,
    required this.comment,
    required this.avatarUrl,
  });

  final String name;
  final String rating;
  final String comment;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/solar_star-bold.png',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                comment,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// RECOMMENDATION SECTION
// ============================================================================

class _RecommendationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _SectionHeader(title: 'Recommendation', actionText: 'See All'),
        SizedBox(height: 10),
        BestTodayCard(),
      ],
    );
  }
}

// ============================================================================
// REUSABLE SECTION HEADER
// ============================================================================

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.actionText});

  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          actionText,
          style:
              Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(
                color: ColorName.primary800,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}

// ============================================================================
// READ MORE TEXT WIDGET
// ============================================================================

class InlineReadMoreText extends StatefulWidget {
  const InlineReadMoreText(
    this.text, {
    super.key,
    this.maxLines = 3,
    this.style,
    this.moreText = ' Read more',
    this.lessText = ' Read less',
  });

  final String text;
  final int maxLines;
  final TextStyle? style;
  final String moreText;
  final String lessText;

  @override
  State<InlineReadMoreText> createState() => _InlineReadMoreTextState();
}

class _InlineReadMoreTextState extends State<InlineReadMoreText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.style ?? Theme.of(context).textTheme.bodyMedium!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(text: widget.text, style: textStyle);
        final tp = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflowing = tp.didExceedMaxLines;

        if (!isOverflowing) {
          return Text(widget.text, style: textStyle);
        }

        if (_expanded) {
          return GestureDetector(
            onTap: () => setState(() => _expanded = false),
            child: RichText(
              text: TextSpan(
                style: textStyle,
                children: [
                  TextSpan(text: widget.text),
                  TextSpan(
                    text: widget.lessText,
                    style: textStyle.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return GestureDetector(
          onTap: () => setState(() => _expanded = true),
          child: RichText(
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: textStyle,
              children: [
                TextSpan(text: widget.text),
                TextSpan(
                  text: widget.moreText,
                  style: textStyle.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
