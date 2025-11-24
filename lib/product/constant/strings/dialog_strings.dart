import 'package:flutter/material.dart';

@immutable
final class DialogStrings {
  const DialogStrings._();

  // Update Dialog
  static const String updateTitle = 'New Update Available! 🚀';
  static const String updateDescription = 'Update the app to try new features.';
  static const String updatePrimaryButton = 'Update';
  static const String updateSecondaryButton = 'Later';

  // Force Update Dialog
  static const String forceUpdateTitle = 'Update Required! ⚠️';
  static const String forceUpdateDescription =
      'You need to update the app to continue using it.';
  static const String forceUpdatePrimaryButton = 'Update Now';
  static const String forceUpdateSecondaryButton = 'Exit';
}
