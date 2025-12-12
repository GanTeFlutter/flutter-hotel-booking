import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hotel_booking/product/enum/firebase_collections.dart';
import 'package:gen/gen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FirebaseHotelService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Tüm otelleri getir
  Future<List<Hotel>> getHotels() async {
    final snapshot = await _firestore
        .collection(FirestoreCollection.hotels.name)
        .get();
    return snapshot.docs.map((doc) => Hotel.fromJson(doc.data())).toList();
  }

  Future<List<MapMarkerModel>> getAllHotelLocations() async {
    final result = await _firestore
        .collection(FirestoreCollection.hotels.name)
        .get();

    return result.docs.map((doc) {
      final hotel = Hotel.fromJson(doc.data());

      return MapMarkerModel(
        positions: [
          LatLng(
            hotel.location.lat,
            hotel.location.lng,
          ),
        ],
        title: hotel.name,
        description: hotel.description,
        imageUrl: hotel.images.first,
      );
    }).toList();
  }
}

class MapMarkerModel {
  MapMarkerModel({
    required this.positions,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  final List<LatLng> positions;
  final String title;
  final String description;
  final String imageUrl;
}
