// widget/map_button.dart
import 'package:flutter/material.dart';

final class MapButton extends StatelessWidget {
  const MapButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black87,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }
}
