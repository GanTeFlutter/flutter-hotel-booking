import 'package:flutter/material.dart';

@immutable
final class AuthStrings {
  const AuthStrings._();

  // Login
  static const String loginTitle = "Let's Sign you in";
  static const String loginSubtitle = 'Lorem ipsum dolor sit amet, consectetur';
  static const String emailLabel = 'Email Address';
  static const String passwordLabel = 'Password';
  static const String emailHint = 'Enter your email address';
  static const String passwordHint = 'Enter your password';
  static const String rememberMe = 'Remember Me';
  static const String forgotPassword = 'Forgot Password';
  static const String signIn = 'Sign In';
  static const String orSignInWith = 'Or Sign In with';

  // Sign Up
  static const String signUpTitle = 'Create Account';
  static const String signUpTitleDescription =
      'Lorem ipsum dolor sit amet, consectetur';
  static const String fullName = 'Full Name';
  static const String enterYourName = 'Enter your name';
  static const String createAccount = 'Create An Account';
  static const String noAccount1 = "Don't have an account?";
  static const String noAccount2 = 'Register';
  static const String noAccount3 = 'Sign Up';
  static const String termsAgreement = 'By signing up you agree to our ';
  static const String termsAgreement2 = 'Terms and Conditions of Use';

  // OTP
  static const String enterOtp = 'Enter OTP';
  static const String otpSentMessage =
      'We have just sent you 4 digit code via your email example@gmail.com';
  static const String resendCode = "Didn't receive code? Resend Code ";
  static const String resendCode2 = 'Resend Code';

  // Forgot Password
  static const String forgotPasswordTitle = 'Forgot Password';
  static const String recoverPasswordSubtitle = 'Recover your account password';
  static const String next = 'Next';
}
