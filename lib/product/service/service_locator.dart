
import 'package:flutter_hotel_booking/product/service/services/sesvice_logger.dart';
import 'package:flutter_hotel_booking/product/service/services/sesvice_shared_preferences.dart';
import 'package:flutter_hotel_booking/product/service/services/sesvice_url_launcher.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

/// Tüm servisleri kaydeder ve başlatır
Future<void> setupLocator() async {
  _registerSingletons();
  await _initializeServices();
}

/// Servisleri başlatır (init fonksiyonlarını çağırır)
Future<void> _initializeServices() async {
  await locator<SharedPreferencesService>().init();
}

/// Singleton servisleri kaydeder
void _registerSingletons() {
  locator
    ..registerSingleton<LoggerService>(LoggerService())
    ..registerSingleton<SharedPreferencesService>(SharedPreferencesService())
    ..registerSingleton<UrlLauncherService>(UrlLauncherService());
}

/// GetIt instance'ına kolay erişim için extension
///
/// Kullanım:
/// - locator.logger
/// - locator.sharedprefs
/// - locator.urlLauncher
extension ServiceLocator on GetIt {
  LoggerService get loggerService => locator<LoggerService>();

  SharedPreferencesService get sharedprefsService =>
      locator<SharedPreferencesService>();

  UrlLauncherService get urlLauncherService => locator<UrlLauncherService>();
}
