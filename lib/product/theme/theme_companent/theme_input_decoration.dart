import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
  hintStyle: GoogleFonts.jost(
    fontWeight: FontWeight.w500,
    color: ColorName.greyscale200,
  ),

  prefixIconColor: ColorName.greyscale4,
  suffixIconColor: ColorName.greyscale4,
  contentPadding: const EdgeInsets.symmetric(
    vertical: 18,
    horizontal: 20,
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: ColorName.greyscale4, width: 2),
  ),
);
