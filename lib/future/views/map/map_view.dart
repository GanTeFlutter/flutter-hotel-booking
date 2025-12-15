import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/map/state/map_cubit.dart';
import 'package:flutter_hotel_booking/future/views/map/widget/custom_traffic_button.dart';
import 'package:flutter_hotel_booking/future/views/map/widget/map_appbar.dart';
import 'package:flutter_hotel_booking/future/views/map/widget/map_button.dart';

import 'package:flutter_hotel_booking/future/views/map/widget/map_right_side_buttons.dart';
import 'package:flutter_hotel_booking/future/views/map/widget/map_type_selector_button.dart';
import 'package:flutter_hotel_booking/product/constant/strings/maps/map_const.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MapAppBar(),
      body: Stack(
        children: [
          BlocConsumer<MapCubit, MapState>(
            listener: (context, state) {},
            builder: (context, state) {
              return GoogleMap(
                padding: const EdgeInsets.only(bottom: 5, left: 5),
                compassEnabled: false,
                initialCameraPosition: state.maybeMap(
                  loaded: (s) => s.cameraPosition,
                  orElse: () => MapConstants.initialCameraPosTurkey,
                ),
                markers: state.maybeMap(
                  loaded: (s) => s.markers,
                  orElse: () => {},
                ),
                mapType: state.maybeMap(
                  loaded: (s) => s.mapType,
                  orElse: () => MapType.normal,
                ),
                onMapCreated: (ctrl) {
                  context.read<MapCubit>().controller = ctrl;
                },
                trafficEnabled: state.maybeMap(
                  loaded: (s) => s.trafficEnabled,
                  orElse: () => false,
                ),
                cameraTargetBounds: state.maybeMap(
                  loaded: (s) => s.cityBounds != null
                      ? CameraTargetBounds(s.cityBounds)
                      : CameraTargetBounds(
                          MapConstants.istanbulBounds,
                        ),
                  orElse: () => CameraTargetBounds(MapConstants.istanbulBounds),
                ),
                minMaxZoomPreference: const MinMaxZoomPreference(10, 18),
              );
            },
          ),

          RightSideButtons(
            children: [
              const MapTypeSelectorButton(),
              MapButton(
                icon: Icons.my_location,
                onPressed: () => context.read<MapCubit>().goToMyLocation(),
              ),
              MapButton(
                icon: Icons.find_replace_outlined,
                onPressed: () => context.read<MapCubit>().loadHotelMarkers(),
              ),

              const CustomTrafficButton(),
            ],
          ),

          // Positioned(
          //   bottom: 10,
          //   left: 0,
          //   right: 0,
          //   child: MapDescriptionCard(size: size.height * 0.19),
          // ),
        ],
      ),
    );
  }

  void homeSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
