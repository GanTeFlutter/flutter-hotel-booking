// widget/custom_traffic_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/map/state/map_cubit.dart';
import 'package:flutter_hotel_booking/future/views/map/widget/map_button.dart';

class CustomTrafficButton extends StatelessWidget {
  const CustomTrafficButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        final isTrafficEnabled = state.maybeMap(
          loaded: (s) => s.trafficEnabled,
          orElse: () => false,
        );
        return MapButton(
          icon: Icons.traffic_outlined,
          isActive: isTrafficEnabled,
          onPressed: () => context.read<MapCubit>().toggleMapTraffic(),
        );
      },
    );
  }
}
