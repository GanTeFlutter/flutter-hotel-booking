import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/login/sigin/sig_in_view.dart';
import 'package:flutter_hotel_booking/product/constant/strings/key/app_keys.dart';
import 'package:flutter_hotel_booking/product/extension/show_snackbar.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';

abstract class SigInViewModel extends State<SignView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
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
    if (AppKeys.signInFormKey.currentState!.validate()) {
      try {
        context.read<AuthBloc>().add(
          AuthSignInRequested(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
      } on Exception catch (e) {
        if (mounted) {
          context.showSnackBar(e.toString(), isError: true);
        }
      }
    }
  }
}
