import 'package:flutter_hotel_booking/product/service/services/sesvice_logger.dart';
import 'package:flutter_hotel_booking/product/service/services/sesvice_shared_preferences.dart';
import 'package:flutter_hotel_booking/product/service/services/sesvice_url_launcher.dart';
import 'package:get_it/get_it.dart';

/// GetIt service locator instance
///
/// Dependency Injection için kullanılır.
/// Tüm uygulama servislerine global erişim sağlar.
final GetIt locator = GetIt.instance;

/// Tüm servisleri kaydeder ve başlatır
///
/// Bu fonksiyon [main()] içinde, [runApp()] öncesinde çağrılmalıdır.
///
/// Örnek:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await setupLocator();
///   runApp(MyApp());
/// }
/// ```
Future<void> setupLocator() async {
  _registerSingletons();
  await _initializeServices();
}

/// Servisleri başlatır (init fonksiyonlarını çağırır)
///
/// Bazı servisler kayıt sonrası initialize edilmelidir.
/// Örneğin [SharedPreferencesService] instance oluşturulmalı.
Future<void> _initializeServices() async {
  await locator<SharedPreferencesService>().init();
}

/// Singleton servisleri kaydeder
///
/// Tüm servisler uygulama boyunca tek instance olarak kullanılır.
/// Yeni servis eklerken buraya eklenmeli ve extension'a getter yazılmalı.
void _registerSingletons() {
  locator
    ..registerSingleton<LoggerService>(LoggerService())
    ..registerSingleton<SharedPreferencesService>(SharedPreferencesService())
    ..registerSingleton<UrlLauncherService>(UrlLauncherService());
}

/// GetIt instance'ına kolay erişim için extension
///
/// Servis kullanımını daha temiz hale getirir.
///
/// Kullanım:
/// ```dart
/// // ❌ Eski yöntem
/// locator<LoggerService>().d('Mesaj');
///
/// // ✅ Extension ile
/// locator.loggerService.d('Mesaj');
/// ```
extension ServiceLocator on GetIt {
  /// Logger servisine erişim
  ///
  /// Loglama işlemleri için kullanılır.
  LoggerService get loggerService => locator<LoggerService>();

  /// SharedPreferences servisine erişim
  ///
  /// Local veri saklama işlemleri için kullanılır.
  SharedPreferencesService get spService => locator<SharedPreferencesService>();

  /// UrlLauncher servisine erişim
  ///
  /// Harici URL, telefon, email açma işlemleri için kullanılır.
  UrlLauncherService get urlLauncherService => locator<UrlLauncherService>();
}
