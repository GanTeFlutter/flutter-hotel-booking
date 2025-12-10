import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/constant/strings/map_const.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firebase_firestore/firebase_firestore.dart';
import 'package:flutter_hotel_booking/product/service/services/service_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this._serviceLocation, this._serviceHotel)
    : super(const MapState.initial());

  GoogleMapController? _controller;
  final ServiceLocation _serviceLocation;
  final FirebaseHotelService _serviceHotel;

  void setController(GoogleMapController ctrl) {
    _controller = ctrl;
  }

  void addMarker(LatLng position, String description) {
    final current = state;
    if (current is _Loaded) {
      final newMarker = Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: InfoWindow(title: description),
      );
      final updatedMarkers = Set<Marker>.from(current.markers)..add(newMarker);
      emit(current.copyWith(markers: updatedMarkers));
    } else {
      final newMarker = Marker(
        markerId: MarkerId(position.toString()),
        position: position,
      );
      emit(MapState.loaded(markers: {newMarker}));
    }
  }

  Future<void> loadHotelMarkers() async {
    final locations = await _serviceHotel.getAllHotelLocations();
    final markers = locations.map((location) {
      return Marker(
        markerId: MarkerId(location.toString()),
        position: location,
      );
    }).toSet();

    final current = state;
    if (current is _Loaded) {
      // Mevcut mapType'ı koru
      emit(current.copyWith(markers: markers));
    } else {
      emit(MapState.loaded(markers: markers));
    }
  }

  void goToMyLocation() {
    _serviceLocation.getMyLocation().then((position) {
      final controller = _controller;
      if (controller != null) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            MapConstants.cameraFrom(
              LatLng(position.latitude, position.longitude),
            ),
          ),
        );
      }
    });
  }

  void changeMapType(MapType type) {
    final current = state;
    if (current is _Loaded) {
      emit(current.copyWith(mapType: type));
    } else {
      emit(MapState.loaded(markers: {}, mapType: type));
    }
  }

  void gotoTurkeyMap() {
    _controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: LatLng(39.9334, 32.8597),
          zoom: 5,
          bearing: 4,
          tilt: 50,
        ),
      ),
    );
  }
}
