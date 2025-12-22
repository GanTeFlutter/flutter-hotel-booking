import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/login/signup/sign_up_view.dart';
import 'package:flutter_hotel_booking/product/constant/strings/key/app_keys.dart';

import 'package:flutter_hotel_booking/product/constant/strings/navigation/navigation_strings.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firebase_auth/firebase_auth_service.dart';

import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

abstract class SignUpViewModel extends State<SignUpView> {
  
  late final FirebaseAuthService _firebaseAuthService;
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final ValueNotifier<bool> obscurePassword = ValueNotifier(true);

  @override
  void initState() {
    _firebaseAuthService = FirebaseAuthService();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> appCustomElevatedButtonOnPressed() async {
    if (AppKeys.signUpFormKey.currentState?.validate() ?? false) {
      final fullName = fullNameController.text;
      final email = emailController.text;
      final password = passwordController.text;
      final tempUserId = _firebaseAuthService.generateTempUserId();
      await context.pushNamed(
        NavigationStrings.enterOtpView,
        extra: OtpParams(
          fullName: fullName,
          tempUserId: tempUserId,
          email: email,
          password: password,
          isSignUp: true,
        ),
      );
    }
  }
}
