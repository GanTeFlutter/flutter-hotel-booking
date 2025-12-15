// product/model/city_config.dart
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CityConfig {
  CityConfig({
    required this.id,
    required this.plateCode,
    required this.name,
    required this.region,
    required this.bounds,
    required this.center,
    required this.minZoom,
    required this.maxZoom,
    required this.defaultZoom,
  });

  factory CityConfig.fromJson(Map<String, dynamic> json) {
    final boundsMap = json['bounds'] as Map<String, dynamic>;
    final southwestMap = boundsMap['southwest'] as Map<String, dynamic>;
    final northeastMap = boundsMap['northeast'] as Map<String, dynamic>;
    final centerMap = json['center'] as Map<String, dynamic>;

    return CityConfig(
      id: json['id'] as String,
      plateCode: json['plateCode'] as String,
      name: json['name'] as String,
      region: json['region'] as String,
      bounds: LatLngBounds(
        southwest: LatLng(
          southwestMap['lat'] as double,
          southwestMap['lng'] as double,
        ),
        northeast: LatLng(
          northeastMap['lat'] as double,
          northeastMap['lng'] as double,
        ),
      ),
      center: LatLng(
        centerMap['lat'] as double,
        centerMap['lng'] as double,
      ),
      minZoom: json['minZoom'] as int,
      maxZoom: json['maxZoom'] as int,
      defaultZoom: json['defaultZoom'] as int,
    );
  }

  final String id;
  final String plateCode;
  final String name;
  final String region;
  final LatLngBounds bounds;
  final LatLng center;
  final int minZoom;
  final int maxZoom;
  final int defaultZoom;
}
