import 'package:flutter/material.dart';

@immutable
final class SharedPrefKeys {
  const SharedPrefKeys._();

  static const String onboardCompleted = 'onboard_completed';
  static const String cacheThemeMode = 'cache_theme_mode';
  static const String userId = 'user_id';
  static const String userToken = 'user_token';
}
