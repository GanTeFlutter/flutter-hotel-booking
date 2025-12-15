import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gen/gen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CityService {
  List<CityConfig>? _cities;

  /// sadece bir kez yüklenir (cache)
  Future<List<CityConfig>> _loadCities() async {
    if (_cities != null) return _cities!;

    final jsonString = await rootBundle.loadString(
      'assets/cities.json',
    );

    final jsonList = jsonDecode(jsonString) as List;
    _cities = jsonList
        .map((e) => CityConfig.fromJson(e as Map<String, dynamic>))
        .toList();

    return _cities!;
  }

  /// public getter
  Future<List<CityConfig>> getCities() => _loadCities();

  /// Konuma göre şehir bul
  Future<CityConfig?> getCityFromLocation() async {
    final position = await Geolocator.getCurrentPosition();

    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isEmpty) return null;

    final cityName = placemarks.first.administrativeArea;
    final cityList = await _loadCities();

    return cityList.firstWhere(
      (city) => city.name.toLowerCase() == cityName?.toLowerCase(),
      orElse: () => cityList.first,
    );
  }

  Future<CityConfig?> getCityById(String id) async {
    final cityList = await _loadCities();
    return cityList.firstWhere((c) => c.id == id);
  }

  Future<CityConfig?> getCityByPlateCode(String plateCode) async {
    final cityList = await _loadCities();
    return cityList.firstWhere((c) => c.plateCode == plateCode);
  }
}
