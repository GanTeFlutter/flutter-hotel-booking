import 'package:flutter/material.dart';

@override
ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
);
