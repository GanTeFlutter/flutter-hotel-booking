import 'package:flutter/material.dart';

@immutable
class AppStrings {
  const AppStrings._();

  // -------------------- APP INFO --------------------
  static const String appName = 'Hotel Booking';

  // -------------------- SHARED PREF KEYS --------------------
  static const String spkOnboardCompleted = 'is_first_launch';
  static const String spkCacheThemeMode = 'cache_theme_mode';

  // -------------------- URLS --------------------
  static const String urlWebsite = 'https://akillisletme.com/';






  // -------------------- ROUTES --------------------
  static const String routerHomeView = 'homeView';
  static const String routerVersionUpdateView = 'versionUpdateView';
  static const String routerRegisterView = 'registerView';

  // OnBoarding
  static const String routerOnBoardingStep1View = 'onBoardingStep1View';
  static const String routerOnBoardingStep2View = 'onBoardingStep2View';
  static const String routerOnBoardingStep3View = 'onBoardingStep3View';

  // Login Process
  static const String routerSignUpView = 'signUpView';
  static const String routerSignInView = 'signInView';
  static const String routerEnterOtpView = 'enterOtpView';
  static const String routerForgotPasswordView = 'forgotPasswordView';
  static const String routerCreateNewPasswordView = 'createNewPasswordView';
















  // -------------------- SPLASH SCREEN --------------------
  static const String splashLoading = 'Yükleniyor...';
  static const String splashErrorOccurred = 'Bir Hata Oluştu';
  static const String splashRetryButton = 'Tekrar Dene';

  // -------------------- ONBOARDING GENERAL --------------------
  static const String onBoardingButtonContinue = 'Continue';
  static const String onBoardingButtonGetStarted = 'Get Started';

  static const String onBoardingHotelName = 'Grand Hotel';
  static const String onBoardingHotelDescription =
      'Find Your Perfect Stay, Anytime, Anywhere';
  static const String onBoardingStep1Title =
      'Luxury and Comfort,\nJust a Tap Away';
  static const String onBoardingStep1Description =
      'Semper in cursus magna et eu varius\n'
      'nunc adipiscing. Elementum justo, laoreet\n'
      'id sem.';
  static const String onBoardingStep2Title =
      'Book with Ease, Stay\n with Style';
  static const String onBoardingStep2Description =
      'Semper in cursus magna et eu varius\n'
      'nunc adipiscing. Elementum justo, laoreet\n'
      'id sem.';
  static const String onBoardingStep3Title =
      'Discover Your Dream\nHotel, Effortlessly';
  static const String onBoardingStep3Description =
      'Lorem Ipsum is simply dummy text of the printing and\n'
      'typesetting industry.';

  // ---------- AUTH: LOGIN ----------
  static const String loginTitle = 'Let’s Sign you in';
  static const String loginSubtitle = 'Lorem ipsum dolor sit amet, consectetur';
  static const String emailLabel = 'Email Address';
  static const String passwordLabel = 'Password';
  static const String emailHint = 'Enter your email address';
  static const String passwordHint = 'Enter your password';
  static const String rememberMe = 'Remember Me';
  static const String forgotPassword = 'Forgot Password';
  static const String signIn = 'Sign In';
  static const String noAccount1 = 'Don’t have an account? ';
  static const String noAccount2 = 'Register';
  static const String noAccount3 = 'Sign Up';
  static const String orSignInWith = 'Or Sign In with';
  static const String termsAgreement = 'By signing up you agree to our ';
  static const String termsAgreement2 = 'Terms and Conditions of Use';

  static const String createAccount = 'Create An Account';
  static const String enterOtp = 'Enter OTP';
  static const String otpSentMessage =
      'We have just sent you 4 digit code via your email example@gmail.com';
  static const String resendCode = 'Didn’t receive code? Resend Code';
  static const String forgotPasswordTitle = 'Forgot Password';
  static const String recoverPasswordSubtitle = 'Recover your account password';
  static const String next = 'Next';

  //Sign Up

  static const String fullName = 'Full Name';
  static const String enterYourName = 'Enter your name';
  static const String signUpTitle = 'Create Account';
  static const String signUpTitleDescription =
      'Lorem ipsum dolor sit amet, consectetur';
}
