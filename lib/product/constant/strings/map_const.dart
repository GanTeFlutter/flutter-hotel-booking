import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapConstants {
  MapConstants._();

  static const LatLng anpitkabir = LatLng(39.9255, 32.8372);

  static const CameraPosition initialCamera = CameraPosition(
    target: anpitkabir,
    zoom: 17,
    bearing: 30,
    tilt: 50,
  );
  static CameraPosition cameraFrom(LatLng target) {
    return CameraPosition(target: target, zoom: 17, bearing: 30, tilt: 50);
  }
}
