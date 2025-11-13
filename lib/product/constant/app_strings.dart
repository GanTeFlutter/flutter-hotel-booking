import 'package:flutter/material.dart';

@immutable
class AppStrings {
  const AppStrings._();

  static const String appName = 'Hotel Booking';

  //Shared Preferences Keys
  static const String spkOnboardCompleted = 'is_first_launch';

  //Url
  static const String urlWebsite = 'https://akillisletme.com/';

  //Routes
  static const String routerHomeView = 'homeView';
  static const String routerVersionUpdateView = 'versionUpdateView';

  // Splash Screen
  static const String splashLoading = 'Yükleniyor...';
  static const String splashErrorOccurred = 'Bir Hata Oluştu';
  static const String splashRetryButton = 'Tekrar Dene';

  // On boarding
  static const String obHotelName = 'Grand Hotel';
  static const String obHotelDescription =
      'Find Your Perfect Stay, Anytime, Anywhere';
}
