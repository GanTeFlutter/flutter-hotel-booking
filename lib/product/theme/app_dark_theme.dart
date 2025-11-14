import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/theme/base_theme.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppDarkTheme implements BaseTheme {
  @override
  ThemeData get themeData => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme,
    ),
  );

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      const ElevatedButtonThemeData();
}
