import 'package:flutter/material.dart';

// Light Theme Elevated Button
ElevatedButtonThemeData get lightElevatedButtonThemeData =>
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        minimumSize: const Size(64, 48),
      ),
    );

// Dark Theme Elevated Button
ElevatedButtonThemeData get darkElevatedButtonThemeData =>
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        minimumSize: const Size(64, 48),
      ),
    );
