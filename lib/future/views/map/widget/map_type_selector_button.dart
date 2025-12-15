import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/map/state/map_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final class MapTypeSelectorButton extends StatelessWidget {
  const MapTypeSelectorButton({super.key});

  static const _mapTypes = [
    (MapType.normal, 'Normal', Icons.map),
    (MapType.satellite, 'Uydu', Icons.satellite),
    (MapType.terrain, 'Arazi', Icons.terrain),
    (MapType.hybrid, 'Hibrit', Icons.layers),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MapCubit, MapState, MapType>(
      selector: (state) => state.maybeMap(
        loaded: (s) => s.mapType,
        orElse: () => MapType.normal,
      ),
      builder: (context, currentMapType) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
          ),
          child: PopupMenuButton<MapType>(
            icon: const Icon(Icons.layers, color: Colors.black87),
            onSelected: (type) => context.read<MapCubit>().changeMapType(type),
            itemBuilder: (_) => _mapTypes
                .map((e) => _buildItem(e.$1, e.$2, e.$3, currentMapType))
                .toList(),
          ),
        );
      },
    );
  }

  PopupMenuItem<MapType> _buildItem(
    MapType type,
    String title,
    IconData icon,
    MapType current,
  ) {
    final isSelected = current == type;
    return PopupMenuItem<MapType>(
      value: type,
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.deepPurple : Colors.grey),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.deepPurple : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isSelected) ...[
            const Spacer(),
            const Icon(Icons.check, color: Colors.deepPurple, size: 18),
          ],
        ],
      ),
    );
  }
}
