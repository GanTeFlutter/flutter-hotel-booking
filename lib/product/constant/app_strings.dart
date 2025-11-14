import 'package:flutter/material.dart';

@immutable
class AppStrings {
  const AppStrings._();

  static const String appName = 'Hotel Booking';

  //Shared Preferences Keys
  static const String spkOnboardCompleted = 'is_first_launch';
  static const String spkCacheThemeMode = 'cache_theme_mode';


  //Url
  static const String urlWebsite = 'https://akillisletme.com/';

  //Routes
  static const String routerHomeView = 'homeView';

  static const String routerVersionUpdateView = 'versionUpdateView';

  static const String routerOnBoardingStep1View = 'onBoardingStep1View';
  static const String routerOnBoardingStep2View = 'onBoardingStep2View';
  static const String routerOnBoardingStep3View = 'onBoardingStep3View';

  // Splash Screen
  static const String splashLoading = 'Yükleniyor...';
  static const String splashErrorOccurred = 'Bir Hata Oluştu';
  static const String splashRetryButton = 'Tekrar Dene';

  // On boarding
  static const String onBoardingButtonContinue = 'Continue';
  static const String onBoardingButtonGetStarted = 'Get Started';

  static const String onBoardingHotelName = 'Grand Hotel';
  static const String onBoardingHotelDescription =
      'Find Your Perfect Stay, Anytime, Anywhere';

  static const String onBoardingStep1Title =
      'Luxury and Comfort,\nJust a Tap Away';
  static const String onBoardingStep1Description =
      'Semper in cursus magna et eu varius\nnunc adipiscing. Elementum justo, laoreet\nid sem.';

  static const String onBoardingStep2Title =
      'Book with Ease, Stay\n with Style';
  static const String onBoardingStep2Description =
      'Semper in cursus magna et eu varius\n nunc adipiscing. Elementum justo, laoreet\nid sem .';

  static const String onBoardingStep3Title =
      'Discover Your Dream\nHotel, Effortlessly';

  static const String onBoardingStep3Description =
      'Lorem Ipsum is simply dummy text of the printing and\ntypesetting industry.';
}
