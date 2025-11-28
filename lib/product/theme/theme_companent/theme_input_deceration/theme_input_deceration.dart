import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:google_fonts/google_fonts.dart';

// Light Theme Input Decoration
InputDecorationTheme get lightInputDecorationTheme =>
    const InputDecorationTheme(
      hintStyle: TextStyle(
        fontFamily: FontFamily.jost,
        fontWeight: FontWeight.w500,
      ),
      prefixIconColor: ColorName.greyscale4,
      suffixIconColor: ColorName.greyscale4,
      contentPadding: EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 20,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: ColorName.greyscale4, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      filled: true,
    );

// Dark Theme Input Decoration
InputDecorationTheme get darkInputDecorationTheme => InputDecorationTheme(
  hintStyle: GoogleFonts.jost(
    fontWeight: FontWeight.w500,
  ),
  contentPadding: const EdgeInsets.symmetric(
    vertical: 18,
    horizontal: 20,
  ),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  errorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  filled: true,
);
