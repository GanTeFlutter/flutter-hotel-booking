import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/login/signup/sign_up_view.dart';
import 'package:flutter_hotel_booking/product/constant/app_keys.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/service/firebase/login/firebase_otp_service.dart';
import 'package:go_router/go_router.dart';

abstract class SignUpViewModel extends State<SignUpView> {
  late final FirebaseOtpService _firebaseOtpService;

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _firebaseOtpService = FirebaseOtpService();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> appCustomElevatedButtonOnPressed() async {
    if (AppKeys.signUpFormKey.currentState?.validate() ?? false) {
      final username = usernameController.text;
      final email = emailController.text;
      final password = passwordController.text;

      final response = await _firebaseOtpService.sendOtp(
        email: email,
        userId: username,
      );
      if (response) {
        if (!mounted) return;
      await context.pushNamed(
          AppStrings.routerEnterOtpView,
          extra: {
            'userId': username,
            'email': email,
            'password': password,
            'isSignUp': true,
          },
        );
      } else {
        // Hata durumunda kullanıcıya bildirim göster
        if (!mounted) return;
        
      }
    } else { 
      if (kDebugMode) {
        print('❌ Form geçersiz');
      }
    }
  }
}
