import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/theme/base_theme.dart';

///App Light Theme
final class AppLightTheme implements BaseTheme {
  @override
  ThemeData get themeData => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
  );
  
  @override
  ThemeData get elevatedButtonThemeData => throw UnimplementedError();
}
