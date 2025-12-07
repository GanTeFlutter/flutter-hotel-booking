import 'package:flutter_hotel_booking/product/service/firebase/firebase_auth/firebase_auth_service.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firebase_firestore/firebase_firestore.dart';
import 'package:flutter_hotel_booking/product/service/firebase/login/firebase_otp_service.dart';
import 'package:flutter_hotel_booking/product/service/services/sesvice_logger.dart';
import 'package:flutter_hotel_booking/product/service/services/sesvice_shared_preferences.dart';
import 'package:flutter_hotel_booking/product/service/services/sesvice_url_launcher.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
   _registerSingletons();
  await _initializeServices();
}

Future<void> _initializeServices() async {
  await locator<SharedPreferencesService>().init();
}

void _registerSingletons() {
  locator
    ..registerSingleton<LoggerService>(LoggerService())
    ..registerSingleton<SharedPreferencesService>(SharedPreferencesService())
    ..registerSingleton<UrlLauncherService>(UrlLauncherService())
    ..registerSingleton(FirebaseAuthService())
    ..registerSingleton(FirebaseOtpService())
    ..registerSingleton(FirebaseHotelService());
}

extension ServiceLocator on GetIt {
  LoggerService get loggerService => locator<LoggerService>();

  SharedPreferencesService get spService => locator<SharedPreferencesService>();

  UrlLauncherService get urlLauncherService => locator<UrlLauncherService>();

  FirebaseAuthService get firebaseAuthService => locator<FirebaseAuthService>();

  FirebaseOtpService get firebaseOtpService => locator<FirebaseOtpService>();

  FirebaseHotelService get firebaseHotelService => locator<FirebaseHotelService>();
}
