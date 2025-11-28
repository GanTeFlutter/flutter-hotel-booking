import 'package:flutter_hotel_booking/product/constant/strings/key/shared_pref_keys.dart';
import 'package:flutter_hotel_booking/product/enum/theme_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  ThemeMode get themeMode {
    final isDark = _prefs.getBool(SharedPrefKeys.cacheThemeMode) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _prefs.setBool(SharedPrefKeys.cacheThemeMode, mode == ThemeMode.dark);
  }

  bool get isOnboardingCompleted =>
      _prefs.getBool(SharedPrefKeys.onboardCompleted) ?? false;

  Future<void> setOnboardingCompleted({required bool isCompleted}) async {
    await _prefs.setBool(SharedPrefKeys.onboardCompleted, isCompleted);
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }

  Future<void> remove({required String key}) async {
    await _prefs.remove(key);
  }

  bool containsKey({required String key}) {
    return _prefs.containsKey(key);
  }

  Set<String> getAllKeys() {
    return _prefs.getKeys();
  }
}
