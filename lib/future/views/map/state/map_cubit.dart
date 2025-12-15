import 'dart:async';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/constant/strings/maps/map_const.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firebase_firestore/firebase_firestore.dart';
import 'package:flutter_hotel_booking/product/service/services/service_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';
part 'helper/map_helper.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this._serviceLocation, this._serviceHotel)
    : super(const MapState.initial());

  final ServiceLocation _serviceLocation;
  final FirebaseHotelService _serviceHotel;

  GoogleMapController? _controller;

  set controller(GoogleMapController value) {
    _controller = value;
  }

  GoogleMapController? get controller => _controller;

  Future<void> loadHotelMarkers() async {
    final markerModels = await _serviceHotel.getAllHotelLocations();

    final markers = <Marker>{};

    for (final item in markerModels) {
      final icon = await getCircularMarkerFromCache(item.imageUrl);

      markers.add(
        Marker(
          markerId: MarkerId(item.title),
          position: item.positions.first,
          icon: icon,
          infoWindow: InfoWindow(
            title: item.title,
            snippet: item.description,
          ),
        ),
      );
    }

    final current = state;
    if (current is _Loaded) {
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

  void toggleMapTraffic() {
    final current = state;
    if (current is _Loaded) {
      emit(
        current.copyWith(trafficEnabled: !current.trafficEnabled),
      ); // Ters çevir
    } else {
      emit(const MapState.loaded(markers: {}, trafficEnabled: true));
    }
  }



  
 

}
