import 'package:flutter/material.dart';

// Light Theme Navigation Bar
NavigationBarThemeData get lightNavigationBarThemeData =>
    const NavigationBarThemeData(
      elevation: 3,
      height: 80,
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: WidgetStatePropertyAll(
        IconThemeData(
          size: 24,
        ),
      ),
    );

// Dark Theme Navigation Bar
NavigationBarThemeData get darkNavigationBarThemeData =>
    const NavigationBarThemeData(
      elevation: 3,
      height: 80,
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: WidgetStatePropertyAll(
        IconThemeData(
          size: 24,
        ),
      ),
    );
