import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/login/sigin/sig_in_view.dart';
import 'package:flutter_hotel_booking/product/constant/app_keys.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firestore/firebase_firestore_service.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

abstract class SigInViewModel extends State<SignView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FirebaseFirestoreService firestoreService;

  @override
  void initState() {
    super.initState();
    firestoreService = FirebaseFirestoreService();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signInButton() async {
    final tempUserId = firestoreService.generateTempUserId();
    if (AppKeys.signInFormKey.currentState?.validate() ?? false) {
      await context.pushNamed(
        AppStrings.routerEnterOtpView,
        extra: OtpParams(
          tempUserId: tempUserId,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }
}
