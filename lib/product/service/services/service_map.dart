import 'package:geolocator/geolocator.dart';

class ServiceLocation {
  Future<void> requestPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationException('Konum izni reddedildi');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationException(
        'Konum izni kalıcı olarak reddedildi. Ayarlardan açın.',
      );
    }

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationException('Konum servisi kapalı. Lütfen açın.');
    }
  }

  Future<Position> getMyLocation() async {
    await requestPermission();

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }
}

class LocationException implements Exception {
  LocationException(this.message);
  final String message;

  @override
  String toString() => message;
}
