// lib/product/constant/app_shadows.dart
import 'package:flutter/material.dart';

final class AppShadows {
  AppShadows._();

  static final List<Shadow> light3 = [
    Shadow(
      offset: const Offset(0, 0.5),
      blurRadius: 10,
      color: Colors.black.withValues(alpha: 0.3),
    ),
  ];
   static final List<Shadow> light2 = [
    Shadow(
      offset: const Offset(0, 0.5),
      blurRadius: 10,
      color: Colors.black.withValues(alpha: 0.2),
    ),
  ];
}
