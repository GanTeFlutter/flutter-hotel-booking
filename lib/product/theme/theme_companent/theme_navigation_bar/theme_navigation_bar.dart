import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

NavigationBarThemeData get lightNavigationBarThemeData =>
    NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      height: 80,

      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: ColorName.primary800,
          );
        }
        return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: ColorName.greyscale3,
        );
      }),
    );

NavigationBarThemeData get darkNavigationBarThemeData => NavigationBarThemeData(
  indicatorColor: Colors.transparent,
  surfaceTintColor: Colors.transparent,
  backgroundColor: const Color(0xFF1C1B1F),
  height: 80,

  labelTextStyle: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: ColorName.primary800,
      );
    }
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ColorName.greyscale3,
    );
  }),
);
