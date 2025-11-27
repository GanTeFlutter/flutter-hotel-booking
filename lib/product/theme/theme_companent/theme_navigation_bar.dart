import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:google_fonts/google_fonts.dart';

NavigationBarThemeData get navigationBarTheme => NavigationBarThemeData(
  backgroundColor: Colors.transparent,
  elevation: 0,
  indicatorColor: Colors.transparent,
  // iconTheme: WidgetStateProperty.all(
  //   const IconThemeData(
  //     color: Colors.blue,
  //     size: 24,
  //   ),
  // ),

  labelTextStyle: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return GoogleFonts.jost(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      );
    }
    return GoogleFonts.jost(
      color: ColorName.greyscale200,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }),
);
