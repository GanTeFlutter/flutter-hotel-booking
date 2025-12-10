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

  Future<List<LatLng>> getAllHotelLocations() async {
    final result = await _firestore
        .collection(FirestoreCollection.hotels.name)
        .get();

    return result.docs.map((doc) {
      final hotel = Hotel.fromJson(doc.data());
      return LatLng(hotel.location.lat, hotel.location.lng);
    }).toList();
  }
}
