import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/login/signup/sign_up_view.dart';
import 'package:flutter_hotel_booking/product/constant/app_keys.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firestore/firebase_firestore_service.dart';

import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

abstract class SignUpViewModel extends State<SignUpView> {
  late final FirebaseFirestoreService _firestoreService;

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _firestoreService = FirebaseFirestoreService();
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
      final tempUserId = _firestoreService.generateTempUserId();
      await context.pushNamed(
        AppStrings.routerEnterOtpView,
        extra: OtpParams(
          fullName: fullName,
          tempUserId: tempUserId,
          email: email,
          password: password,
          //verify icin 
          isSignUp: true,
        ),
      );
    }
  }
}
