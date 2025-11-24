import 'package:flutter/material.dart';

@immutable
final class NavigationStrings {
  const NavigationStrings._();

  // Main Routes
  static const String homeView = 'homeView';
  static const String versionUpdateView = 'versionUpdateView';
  static const String registerView = 'registerView';

  // OnBoarding Routes
  static const String onBoardingStep1View = 'onBoardingStep1View';
  static const String onBoardingStep2View = 'onBoardingStep2View';
  static const String onBoardingStep3View = 'onBoardingStep3View';

  // Auth Routes
  static const String signUpView = 'signUpView';
  static const String signInView = 'signInView';
  static const String enterOtpView = 'enterOtpView';
  static const String forgotPasswordView = 'forgotPasswordView';
  static const String createNewPasswordView = 'createNewPasswordView';
}
