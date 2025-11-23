import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/login/signup/sign_up_view.dart';
import 'package:flutter_hotel_booking/product/constant/app_keys.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firestore/firebase_firestore_service.dart';
import 'package:flutter_hotel_booking/product/service/firebase/login/firebase_otp_service.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

abstract class SignUpViewModel extends State<SignUpView> {
  late final FirebaseFirestoreService _firestoreService;
  late final FirebaseOtpService _firebaseOtpService;

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _firebaseOtpService = FirebaseOtpService();
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
      debugPrint('--✅ Temp User ID: $tempUserId');
      
        await context.pushNamed(
          AppStrings.routerEnterOtpView,
          extra: OtpParams(
            fullName: fullName,
            tempUserId: tempUserId,
            email: email,
            password: password,
          ),
        );
  
    }
  }
}
