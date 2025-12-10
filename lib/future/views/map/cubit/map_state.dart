part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState.initial() = _Initial;
  const factory MapState.loading() = _Loading;

  const factory MapState.loaded({
    required Set<Marker> markers,
    @Default(MapType.normal) MapType mapType,
    @Default(false) bool buttonActive,
    @Default(MapConstants.initialCamera) CameraPosition cameraPosition,
  }) = _Loaded;

  const factory MapState.error({required String message}) = _Error;
}
