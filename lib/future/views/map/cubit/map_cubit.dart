import 'dart:async';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

  final ServiceLocation _serviceLocation;
  final FirebaseHotelService _serviceHotel;

  GoogleMapController? _controller;

  set controller(GoogleMapController value) {
    _controller = value;
  }

  GoogleMapController? get controller => _controller;

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

Future<BitmapDescriptor> getCircularMarkerFromCache(String imageUrl) async {
  try {
    final imageProvider = CachedNetworkImageProvider(imageUrl);
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    final completer = Completer<ui.Image>();
    imageStream.addListener(
      ImageStreamListener((info, _) => completer.complete(info.image)),
    );
    final image = await completer.future;
    const size = 50.0;
    const border = 3.0;
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder)
      ..drawCircle(
        const Offset(size / 2, size / 2),
        size / 2,
        Paint()..color = Colors.white,
      )
      ..clipPath(
        Path()..addOval(
          Rect.fromCircle(
            center: const Offset(size / 2, size / 2),
            radius: (size / 2) - border,
          ),
        ),
      );

    paintImage(
      canvas: canvas,
      rect: const Rect.fromLTWH(
        border,
        border,
        size - border * 2,
        size - border * 2,
      ),
      image: image,
      fit: BoxFit.cover,
    );

    final img = await recorder.endRecording().toImage(
      size.toInt(),
      size.toInt(),
    );
    final data = await img.toByteData(format: ui.ImageByteFormat.png);

    if (data != null) {
      return BitmapDescriptor.bytes(data.buffer.asUint8List());
    }
  } on Exception catch (e) {
    debugPrint('Circular marker oluşturulamadı: $e');
  }
  return BitmapDescriptor.defaultMarker;
}
