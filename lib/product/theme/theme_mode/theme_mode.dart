import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/theme/theme_companent/index.dart';

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




/**
 *  AppCustomElevatedButton(
                    onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                    text: 'Change Theme',
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                  ),
 */
