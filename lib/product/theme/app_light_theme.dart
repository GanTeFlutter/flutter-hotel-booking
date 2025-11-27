import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/theme/theme_companent/theme_elevated_button.dart';
import 'package:flutter_hotel_booking/product/theme/theme_companent/theme_input_decoration.dart';
import 'package:flutter_hotel_booking/product/theme/theme_companent/theme_navigation_bar.dart';
import 'package:flutter_hotel_booking/product/theme/theme_companent/theme_text.dart';

final class AppLightTheme {
  ThemeData get themeData => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme,
    elevatedButtonTheme: elevatedButtonThemeData,
    inputDecorationTheme: inputDecorationTheme,
    navigationBarTheme: navigationBarTheme,
  );
}
