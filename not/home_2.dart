// // ignore_for_file: avoid_catches_without_on_clauses, use_build_context_synchronously

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gen/gen.dart';

// // 10 Örnek Otel
// final List<Hotel> sampleHotels = [
//   Hotel(
//     id: 'hotel_001',
//     name: 'Grand Istanbul Hotel',
//     description: 'Boğaz manzaralı lüks otel.',
//     images: const ['img1.jpg', 'img2.jpg'],
//     location: const HotelLocation(
//       city: 'İstanbul',
//       country: 'Türkiye',
//       address: 'Beşiktaş',
//       lat: 41.0082,
//       lng: 28.9784,
//     ),
//     averageRating: 4.8,
//     totalReviews: 1250,
//     starRating: 5,
//     minPrice: 3500,
//     facilities: [
//       Facility(id: 'f1', name: 'Spa', category: 'Wellness'),
//       Facility(id: 'f2', name: 'Havuz', category: 'Outdoor'),
//     ],
//     isActive: true,
//     createdAt: DateTime.now(),
//   ),
//   Hotel(
//     id: 'hotel_002',
//     name: 'Kapadokya Cave Suites',
//     description: 'Kaya odalarda konaklama.',
//     images: const ['img1.jpg', 'img2.jpg'],
//     location: const HotelLocation(
//       city: 'Nevşehir',
//       country: 'Türkiye',
//       address: 'Göreme',
//       lat: 38.6431,
//       lng: 34.8289,
//     ),
//     averageRating: 4.9,
//     totalReviews: 890,
//     starRating: 5,
//     minPrice: 4200,
//     facilities: [
//       Facility(id: 'f3', name: 'Balon Turu', category: 'Activity'),
//       Facility(id: 'f4', name: 'Termal Havuz', category: 'Wellness'),
//     ],
//     isActive: true,
//     createdAt: DateTime.now(),
//   ),
//   Hotel(
//     id: 'hotel_003',
//     name: 'Antalya Beach Resort',
//     description: 'Her şey dahil tatil.',
//     images: const ['img1.jpg', 'img2.jpg'],
//     location: const HotelLocation(
//       city: 'Antalya',
//       country: 'Türkiye',
//       address: 'Lara',
//       lat: 36.8969,
//       lng: 30.7133,
//     ),
//     averageRating: 4.5,
//     totalReviews: 2100,
//     starRating: 4,
//     minPrice: 2800,
//     facilities: [
//       Facility(id: 'f5', name: 'Plaj', category: 'Outdoor'),
//       Facility(id: 'f6', name: 'Aquapark', category: 'Entertainment'),
//     ],
//     isActive: true,
//     createdAt: DateTime.now(),
//   ),
//   Hotel(
//     id: 'hotel_004',
//     name: 'Bodrum Marina Hotel',
//     description: 'Marina manzaralı butik otel.',
//     images: const ['img1.jpg', 'img2.jpg'],
//     location: const HotelLocation(
//       city: 'Muğla',
//       country: 'Türkiye',
//       address: 'Bodrum',
//       lat: 37.0344,
//       lng: 27.4305,
//     ),
//     averageRating: 4.6,
//     totalReviews: 650,
//     starRating: 4,
//     minPrice: 3100,
//     facilities: [
//       Facility(id: 'f7', name: 'Tekne Turu', category: 'Activity'),
//       Facility(id: 'f8', name: 'Bar', category: 'Entertainment'),
//     ],
//     isActive: true,
//     createdAt: DateTime.now(),
//   ),
//   Hotel(
//     id: 'hotel_005',
//     name: 'Pamukkale Thermal Spa',
//     description: 'Termal sağlık oteli.',
//     images: const ['img1.jpg', 'img2.jpg'],
//     location: const HotelLocation(
//       city: 'Denizli',
//       country: 'Türkiye',
//       address: 'Pamukkale',
//       lat: 37.9204,
//       lng: 29.1187,
//     ),
//     averageRating: 4.4,
//     totalReviews: 480,
//     starRating: 4,
//     minPrice: 1900,
//     facilities: [
//       Facility(id: 'f9', name: 'Termal Havuz', category: 'Wellness'),
//       Facility(id: 'f10', name: 'Masaj', category: 'Wellness'),
//     ],
//     isActive: true,
//     createdAt: DateTime.now(),
//   ),
//   Hotel(
//     id: 'hotel_006',
//     name: 'Trabzon Uzungöl Lodge',
//     description: 'Doğa içinde huzur.',
//     images: const ['img1.jpg', 'img2.jpg'],
//     location: const HotelLocation(
//       city: 'Trabzon',
//       country: 'Türkiye',
//       address: 'Uzungöl',
//       lat: 40.6182,
//       lng: 40.2897,
//     ),
//     averageRating: 4.7,
//     totalReviews: 320,
//     starRating: 3,
//     minPrice: 1200,
//     facilities: [
//       Facility(id: 'f11', name: 'Doğa Yürüyüşü', category: 'Activity'),
//       Facility(id: 'f12', name: 'Şömine', category: 'Comfort'),
//     ],
//     isActive: true,
//     createdAt: DateTime.now(),
//   ),
//   Hotel(
//     id: 'hotel_007',
//     name: 'Ankara Business Hotel',
//     description: 'İş seyahati için ideal.',
//     images: const ['img1.jpg', 'img2.jpg'],
//     location: const HotelLocation(
//       city: 'Ankara',
//       country: 'Türkiye',
//       address: 'Kızılay',
//       lat: 39.9334,
//       lng: 32.8597,
//     ),
//     averageRating: 4.2,
//     totalReviews: 890,
//     starRating: 4,
//     minPrice: 1500,
//     facilities: [
//       Facility(id: 'f13', name: 'Toplantı Salonu', category: 'Business'),
//       Facility(id: 'f14', name: 'WiFi', category: 'Service'),
//     ],
//     isActive: true,
//     createdAt: DateTime.now(),
//   ),
//   Hotel(
//     id: 'hotel_008',
//     name: 'İzmir Seaside Inn',
//     description: 'Kordon boyunda otel.',
//     images: const ['img1.jpg', 'img2.jpg'],
//     location: const HotelLocation(
//       city: 'İzmir',
//       country: 'Türkiye',
//       address: 'Alsancak',
//       lat: 38.4192,
//       lng: 27.1287,
//     ),
//     averageRating: 4.3,
//     totalReviews: 540,
//     starRating: 3,
//     minPrice: 1100,
//     facilities: [
//       Facility(id: 'f15', name: 'Kahvaltı', category: 'Service'),
//       Facility(id: 'f16', name: 'Bisiklet', category: 'Activity'),
//     ],
//     isActive: true,
//     createdAt: DateTime.now(),
//   ),
//   Hotel(
//     id: 'hotel_009',
//     name: 'Fethiye Ölüdeniz Resort',
//     description: 'Cennet köşesi tatil.',
//     images: const ['img1.jpg', 'img2.jpg'],
//     location: const HotelLocation(
//       city: 'Muğla',
//       country: 'Türkiye',
//       address: 'Ölüdeniz',
//       lat: 36.5499,
//       lng: 29.1156,
//     ),
//     averageRating: 4.8,
//     totalReviews: 1100,
//     starRating: 5,
//     minPrice: 3800,
//     facilities: [
//       Facility(id: 'f17', name: 'Yamaç Paraşütü', category: 'Activity'),
//       Facility(id: 'f18', name: 'Dalış', category: 'Activity'),
//     ],
//     isActive: true,
//     createdAt: DateTime.now(),
//   ),
//   Hotel(
//     id: 'hotel_010',
//     name: 'Bursa Uludağ Ski Hotel',
//     description: 'Kayak oteli.',
//     images: const ['img1.jpg', 'img2.jpg'],
//     location: const HotelLocation(
//       city: 'Bursa',
//       country: 'Türkiye',
//       address: 'Uludağ',
//       lat: 40.0995,
//       lng: 29.0611,
//     ),
//     averageRating: 4.5,
//     totalReviews: 720,
//     starRating: 4,
//     minPrice: 2500,
//     facilities: [
//       Facility(id: 'f19', name: 'Kayak', category: 'Activity'),
//       Facility(id: 'f20', name: 'Sauna', category: 'Wellness'),
//     ],
//     isActive: true,
//     createdAt: DateTime.now(),
//   ),
// ];

// class HotelSeedPage extends StatefulWidget {
//   const HotelSeedPage({super.key});

//   @override
//   State<HotelSeedPage> createState() => _HotelSeedPageState();
// }

// class _HotelSeedPageState extends State<HotelSeedPage> {
//   bool _loading = false;
//   Future<void> _saveToFirebase() async {
//     setState(() => _loading = true);

//     try {
//       final firestore = FirebaseFirestore.instance;

//       for (final hotel in sampleHotels) {
//         final doc = firestore.collection('hotels').doc(hotel.id);

//         // Debug için
//         print('Kaydediliyor: ${hotel.name}');
//         print('JSON: ${hotel.toJson()}');

//         await doc.set(hotel.toJson());
//       }

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('10 otel kaydedildi!')),
//       );
//     } catch (e, stack) {
//       print('HATA: $e');
//       print('STACK: $stack');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Hata: $e')),
//       );
//     }

//     setState(() => _loading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Otel Seed')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _loading ? null : _saveToFirebase,
//           child: _loading
//               ? const CircularProgressIndicator()
//               : const Text("10 Oteli Firebase'e Kaydet"),
//         ),
//       ),
//     );
//   }
// }
