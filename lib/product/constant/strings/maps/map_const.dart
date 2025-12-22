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

  static const CameraPosition initialCameraPosTurkey = CameraPosition(
    target: LatLng(39.9334, 32.8597),
    zoom: 5,
    bearing: 4,
    tilt: 50,
  );

  static CameraPosition cameraFrom(LatLng target) {
    return CameraPosition(target: target, zoom: 17, bearing: 30, tilt: 50);
  }

  static final istanbulBounds = LatLngBounds(
    southwest: const LatLng(40.8054, 28.0552),
    northeast: const LatLng(41.3222, 29.4619),
  );
  static const MinMaxZoomPreference mapBounded = MinMaxZoomPreference(11, 18);
}
