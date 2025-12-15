
import 'package:flutter/material.dart';

final class MapButton extends StatelessWidget {
  const MapButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.isActive = false, 
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool isActive; 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            (isActive ? Colors.blue : Colors.white), 
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5),
        ],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color:
              iconColor ??
              (isActive ? Colors.white : Colors.black87), 
        ),
        onPressed: onPressed,
      ),
    );
  }
}
