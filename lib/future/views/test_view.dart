import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/service/services/service_map.dart';

import 'package:geocoding/geocoding.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  ServiceLocation serviceLocation = ServiceLocation();
  double? latitude;
  double? longitude;
  List<Placemark>? placemarks;
  bool loading = false;
  String? error;

  @override
  void initState() {
    super.initState();
  }

  Future<void> test2() async {
    setState(() {
      loading = true;
    });

    try {
      final position = await serviceLocation.getMyLocation();
      latitude = position.latitude;
      longitude = position.longitude;

      placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placemark Test'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                latitude = null;
                longitude = null;
                placemarks = null;
                error = null;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: test2,
        child: const Icon(Icons.my_location),
      ),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : error != null
            ? Text('Hata: $error')
            : placemarks == null
            ? const Text('Butona bas')
            : _placemarkView(placemarks!.first),
      ),
    );
  }

  Widget _placemarkView(Placemark p) {
    return Padding(
      padding: const EdgeInsets.all(16),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          _row('Latitude', latitude?.toStringAsFixed(6)),
          _row('Longitude', longitude?.toStringAsFixed(6)),
          const Divider(),

          _row('Name', p.name),
          _row('Street', p.street),
          _row('Locality', p.locality),
          _row('SubLocality', p.subLocality),
          _row('AdministrativeArea', p.administrativeArea),
          _row('Country', p.country),
          _row('PostalCode', p.postalCode),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: test2,
            child: const Text('GetPosition'),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text('$label: $value'),
    );
  }
}
