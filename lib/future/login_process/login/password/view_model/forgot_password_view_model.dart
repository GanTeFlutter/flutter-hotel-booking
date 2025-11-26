import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/login/password/forgot_password_view.dart';
import 'package:flutter_hotel_booking/product/constant/strings/key/app_keys.dart';
import 'package:flutter_hotel_booking/product/constant/strings/navigation/navigation_strings.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/widgets.dart';

abstract class ForgotPasswordViewModel extends State<ForgotPasswordView> {
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void next() {
    if (AppKeys.forgotPasswordFormKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        AuthForgotPasswordRequested(email: emailController.text),
      );
    }
  }

  void showSuccessDialog(BuildContext context) {
    DialogHelper.showCustomDialog(
      context: context,
      title: 'Success',
      description: 'Password reset link sent to your email',
      primaryButtonText: 'Go to Mail',
      secondaryButtonText: 'Go to Login',
      onPrimaryPressed: () {
        locator.urlLauncherService.launchEmail(email: emailController.text);
      },
      onSecondaryPressed: () {
        context.goNamed(NavigationStrings.signInView);
      },
    );
  }
}
