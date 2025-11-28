import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/theme/custom_color_scheme.dart';
import 'package:flutter_hotel_booking/product/theme/theme_companent/theme_elevated_button/theme_elevated_button.dart';
import 'package:flutter_hotel_booking/product/theme/theme_companent/theme_input_deceration/theme_input_deceration.dart';
import 'package:flutter_hotel_booking/product/theme/theme_companent/theme_navigation_bar/theme_navigation_bar.dart';

import 'package:flutter_hotel_booking/product/theme/theme_companent/theme_text/theme_text.dart';

final class AppTheme {
  ThemeData get appDarkTheme => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: CustomColorScheme.darkColorScheme,
    textTheme: textTheme,
    elevatedButtonTheme: darkElevatedButtonThemeData,
    inputDecorationTheme: darkInputDecorationTheme,
    navigationBarTheme: darkNavigationBarThemeData,
  );

  ThemeData get appLightTheme => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: CustomColorScheme.lightColorScheme,
    textTheme: textTheme,
    elevatedButtonTheme: lightElevatedButtonThemeData,
    inputDecorationTheme: lightInputDecorationTheme,
    navigationBarTheme: lightNavigationBarThemeData,
  );
}
