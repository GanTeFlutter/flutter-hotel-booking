part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState.initial() = _Initial;
  const factory MapState.loading() = _Loading;

  const factory MapState.loaded({
    // Harita üzerindeki Noktalar
    required Set<Marker> markers,
    // Harita Türü (Normal, Uydu, Arazi vb.)
    @Default(MapType.normal) MapType mapType,
    // Butonun Aktiflik Durumu
    @Default(false) bool buttonActive,
    // Kamera Pozisyonu
    @Default(MapConstants.initialCamera) CameraPosition cameraPosition,
    // Trafik Bilgisinin Gösterilip Gösterilmeyeceği
    @Default(false) bool trafficEnabled,
    // Yakınlaştırma Tercihleri
    @Default(MapConstants.mapBounded)
    MinMaxZoomPreference zoomPreference,
    // Şehir Sınırları
    LatLngBounds? cityBounds,
  }) = _Loaded;

  const factory MapState.error({required String message}) = _Error;
}
