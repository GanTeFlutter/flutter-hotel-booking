import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences yönetimi için servis sınıfı
///
/// Locator ile initialize edilir: await locator.spService.init()
class SharedPreferencesService {
  late final SharedPreferences _prefs;

  /// SharedPreferences instance'ını başlatır
  ///
  /// Not: Bu metod locator tarafından otomatik çağrılır
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ============ ONBOARDING ============

  /// Onboarding tamamlanma durumunu döner
  ///
  /// Default: false (ilk açılışta)
  bool get isOnboardingCompleted =>
      _prefs.getBool(AppStrings.spkOnboardCompleted) ?? false;

  /// Onboarding tamamlanma durumunu günceller
  ///
  /// [isCompleted] - Onboarding tamamlandı mı?
  Future<void> setOnboardingCompleted({required bool isCompleted}) async {
    await _prefs.setBool(AppStrings.spkOnboardCompleted, isCompleted);
  }

  // ============ HELPER METHODS ============

  /// Tüm verileri temizler (logout için)
  Future<void> clearAll() async {
    await _prefs.clear();
  }

  /// Belirli bir key'i siler
  ///
  /// [key] - Silinecek key
  Future<void> remove({required String key}) async {
    await _prefs.remove(key);
  }

  /// Key'in var olup olmadığını kontrol eder
  ///
  /// [key] - Kontrol edilecek key
  bool containsKey({required String key}) {
    return _prefs.containsKey(key);
  }

  /// Tüm key'leri döner (debug için)
  Set<String> getAllKeys() {
    return _prefs.getKeys();
  }
}
