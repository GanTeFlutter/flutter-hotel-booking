import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/theme/base_theme.dart';

final class AppDarkTheme implements BaseTheme {
  @override
  ThemeData get themeData => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
  );

  @override
  ThemeData get elevatedButtonThemeData => throw UnimplementedError();
}
