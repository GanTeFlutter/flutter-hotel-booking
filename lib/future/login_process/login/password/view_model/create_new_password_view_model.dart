import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/login/password/create_new_password_view.dart';
import 'package:flutter_hotel_booking/product/constant/strings/key/app_keys.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';


abstract class CreateNewPasswordViewModel extends State<CreateNewPasswordView> {
  late final TextEditingController emailController;
  late final TextEditingController newPasswordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  void next() {
    if (AppKeys.createNewPasswordFormKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthResetPasswordRequested(
          email: emailController.text,
          newPassword: newPasswordController.text,
        ),
      );
    }
  }
}
