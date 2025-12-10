import 'package:flutter_hotel_booking/product/constant/strings/key/shared_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
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
