import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/service/services/service_json_init.dart';
import 'package:flutter_hotel_booking/product/service/services/service_map.dart';
import 'package:gen/gen.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  late final ServiceLocation _serviceLocation;
  late final CityService _cityService;
  CityConfig? city;

  @override
  void initState() {
    super.initState();
    _serviceLocation = ServiceLocation();
    _cityService = CityService();
  }

  Future<void> test() async {
    await _serviceLocation.requestPermission();
    final result = await _cityService.getCityFromLocation();
    setState(() {
      city = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestView'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                city = null;
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: city == null ? _emptyState() : _cityInfo(city!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: test,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _emptyState() {
    return const Text('Henüz şehir seçilmedi');
  }

  Widget _cityInfo(CityConfig city) {
    return Column(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _row('Şehir', city.name),
        _row('Plaka', city.plateCode),
        _row('Bölge', city.region),
        _row('Lat', city.center.latitude.toStringAsFixed(6)),
        _row('Lng', city.center.longitude.toStringAsFixed(6)),
        _row('Min', city.minZoom.toString()),
        _row('Max', city.maxZoom.toString()),
        _row('Default', city.defaultZoom.toString()),
      ],
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text('$label: $value'),
    );
  }
}
