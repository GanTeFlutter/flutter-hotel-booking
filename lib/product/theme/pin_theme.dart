import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

@immutable
final class AppPinTheme {
  const AppPinTheme._();

  static final PinTheme defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 25,
      color: Colors.grey[800],
      fontWeight: FontWeight.w900,
    ),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(20),
    ),
  );

  static final PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Colors.blue, width: 2),
  );

  static final PinTheme submittedPinTheme = defaultPinTheme.copyWith(
    textStyle: const TextStyle(
      fontSize: 25,
      color: Colors.grey, // Colors.grey[600] yerine
      fontWeight: FontWeight.w700,
    ),
  );

  static final PinTheme errorPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      border: Border.all(color: Colors.red, width: 2),
    ),
  );

  static final PinTheme disabledPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: Colors.grey[400],
      border: Border.all(color: Colors.grey.shade300),
    ),
  );
}
