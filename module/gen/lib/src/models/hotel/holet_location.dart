import 'package:cloud_firestore/cloud_firestore.dart';

class HotelLocation {
  HotelLocation({
    required this.address,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory HotelLocation.fromMap(Map<String, dynamic> map) {
    final geoPoint = map['latlong'] as GeoPoint?;

    return HotelLocation(
      address: map['address'] as String? ?? '',
      city: map['city'] as String? ?? '',
      country: map['country'] as String? ?? '',
      latitude: geoPoint?.latitude ?? 0.0,
      longitude: geoPoint?.longitude ?? 0.0,
    );
  }

  final String address;
  final String city;
  final String country;
  final double latitude;
  final double longitude;

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'city': city,
      'country': country,
      'latlong': GeoPoint(latitude, longitude),
    };
  }
}
