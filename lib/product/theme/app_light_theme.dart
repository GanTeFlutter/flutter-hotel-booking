import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/theme/base_theme.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppLightTheme implements BaseTheme {
  @override
  ThemeData get themeData => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: _textTheme,
    elevatedButtonTheme: elevatedButtonThemeData,
  );

  TextTheme get _textTheme => TextTheme(
    // Display styles (en büyük başlıklar)
    displayLarge: GoogleFonts.jost(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      height: 1.12,
    ),
    displayMedium:GoogleFonts.jost(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.16,
    ),
    displaySmall: GoogleFonts.jost(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.22,
    ),

    // Headline styles (başlıklar)
    headlineLarge: GoogleFonts.jost(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.25,
    ),
    headlineMedium: GoogleFonts.jost(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.29,
    ),
    headlineSmall: GoogleFonts.jost(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.33,
    ),

    // Title styles (kartlarda başlıklar)
    titleLarge: GoogleFonts.inter(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 1.27,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.5,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),

    // Body styles (normal metin)
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.5,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
    ),

    // Label styles (butonlar, chip'ler)
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.33,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.45,
    ),
  );

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
}
