import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/map/cubit/map_cubit.dart';
import 'package:flutter_hotel_booking/future/views/map/widget/map_appbar.dart';
import 'package:flutter_hotel_booking/future/views/map/widget/map_button.dart';
import 'package:flutter_hotel_booking/future/views/map/widget/map_hotel_description_card.dart';
import 'package:flutter_hotel_booking/future/views/map/widget/map_right_side_buttons.dart';
import 'package:flutter_hotel_booking/future/views/map/widget/map_type_selector_button.dart';
import 'package:flutter_hotel_booking/product/constant/strings/map_const.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widgets/widgets.dart';

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
                zoomControlsEnabled: false,
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
                // onLongPress: (position) {
                //   context.read<MapCubit>().addCustomMarker(
                //     position,
                //     'Custom Marker',
                //   );
                // },
              );
            },
          ),

          const CustomTextField(),
          RightSideButtons(
            children: [
              const MapTypeSelectorButton(),
              MapButton(
                icon: Icons.my_location,
                onPressed: () => context.read<MapCubit>().goToMyLocation(),
              ),

              MapButton(
                icon: Icons.mark_email_unread,
                onPressed: () => context.read<MapCubit>().loadHotelMarkers(),
              ),
              MapButton(
                icon: Icons.map,
                onPressed: () => context.read<MapCubit>().gotoTurkeyMap(),
              ),
            ],
          ),

          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: MapDescriptionCard(size: size.height * 0.19),
          ),
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
