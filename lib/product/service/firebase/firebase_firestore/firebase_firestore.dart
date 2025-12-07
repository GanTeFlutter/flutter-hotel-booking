import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hotel_booking/product/enum/firebase_collections.dart';
import 'package:gen/gen.dart';

class FirebaseHotelService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Tüm otelleri getir
  Future<List<Hotel>> getHotels() async {
    final snapshot = await _firestore
        .collection(FirestoreCollection.hotels.name)
        .get();
    return snapshot.docs.map((doc) => Hotel.fromJson(doc.data())).toList();
  }
}
