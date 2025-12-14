import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final class MapDescriptionCard extends StatefulWidget {
  const MapDescriptionCard({required this.size, super.key});

  final double size;

  @override
  State<MapDescriptionCard> createState() => _MapDescriptionCardState();
}

class _MapDescriptionCardState extends State<MapDescriptionCard> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: PageView.builder(
        itemCount: sampleLocations.length,
        controller: _pageController,
        onPageChanged: (index) {
          debugPrint('--PageView.builder onPageChanged $index');
          // final location = sampleLocations[index];
          // context.read<MapCubit>().animateToPosition(location.position);
        },
        itemBuilder: (context, index) {
          final location = sampleLocations[index];
          return _HotelDescriptionCard(
            location: location,
            size: widget.size,
            bookingNowOnTap: () {},
            messageOnTap: () {},
          );
        },
      ),
    );
  }
}

final class _HotelDescriptionCard extends StatelessWidget {
  const _HotelDescriptionCard({
    required this.location,
    required this.size,
    required this.bookingNowOnTap,
    required this.messageOnTap,
  });
  final LocationData location;
  final VoidCallback? bookingNowOnTap;
  final VoidCallback? messageOnTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final imageSize = size * 0.5;
    final padding = size * 0.08;
    final borderRadius = size * 0.08;
    final titleFontSize = size * 0.09;
    final subtitleFontSize = size * 0.07;
    final buttonHeight = size * 0.25;
    final iconSize = size * 0.08;

    return Container(
      margin: EdgeInsets.only(
        bottom: size * 0.08,
        left: size * 0.05,
        right: size * 0.05,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius * 0.75),
                      image: const DecorationImage(
                        image: AssetImage('assets/hotels (5).jpg'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size * 0.05),

                  Expanded(
                    child: SizedBox(
                      height: imageSize,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            location.title,
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            location.description,
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              color: Colors.grey.shade600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            r'$320 /night',
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: iconSize),
                          SizedBox(width: size * 0.02),
                          Text(
                            '4.8',
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              flex: 3,
              child: Row(
                spacing: 20,
                children: [
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: bookingNowOnTap,
                      child: Container(
                        height: buttonHeight,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(
                            borderRadius * 0.75,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Rezervasyon Yap',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: subtitleFontSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: messageOnTap,
                    child: Container(
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/solar_map-point-outline.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model sınıfı - ayrı dosyaya taşınabilir
class LocationData {
  const LocationData({
    required this.title,
    required this.description,
    required this.position,
    required this.distance,
  });
  final String title;
  final String description;
  final LatLng position;
  final double distance;
}

// Örnek veriler - ayrı dosyaya taşınabilir
final List<LocationData> sampleLocations = [
  const LocationData(
    title: 'Taksim Meydanı',
    description: "İstanbul'un en ünlü meydanı",
    position: LatLng(41.0370, 28.9850),
    distance: 1.2,
  ),
  const LocationData(
    title: 'Galata Kulesi',
    description: 'Tarihi kule ve gözlem noktası',
    position: LatLng(41.0256, 28.9741),
    distance: 2.5,
  ),
  const LocationData(
    title: 'Ayasofya',
    description: 'Tarihi cami ve müze',
    position: LatLng(41.0086, 28.9802),
    distance: 3.8,
  ),
];
