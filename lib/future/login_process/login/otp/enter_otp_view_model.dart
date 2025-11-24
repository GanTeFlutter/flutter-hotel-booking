import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/login/otp/enter_otp_view.dart';
import 'package:flutter_hotel_booking/product/constant/strings/app_strings.dart';
import 'package:flutter_hotel_booking/product/extension/show_snackbar.dart';

import 'package:flutter_hotel_booking/product/service/firebase/login/firebase_otp_service.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';

import 'package:flutter_hotel_booking/product/state/cubit/countdown/countdown_cubit.dart';
import 'package:go_router/go_router.dart';

abstract class EnterOtpViewModel extends State<EnterOtpView> {
  late final FirebaseOtpService _firebaseOtpService;
  late final TextEditingController pinController;

  bool isLoading = false;
  bool codeSent = false;
  bool hasError = false;

  bool enabledPinput = true;

  @override
  void initState() {
    super.initState();
    _firebaseOtpService = FirebaseOtpService();
    pinController = TextEditingController();
    sendCode();
  }

  Future<void> sendCode() async {
    setState(() => isLoading = true);
    final response = await _firebaseOtpService.sendOtp(
      email: widget.params.email,
      tempUserId: widget.params.tempUserId,
    );
    if (response && mounted) {
      context.showSnackBar('Kod başarıyla gönderildi');
      codeSent = true;
      context.read<CountdownCubit>().start();
    } else if (!response && mounted) {
      context.showSnackBar(
        'Kod gönderilemedi. Lütfen tekrar deneyin.',
        isError: true,
      );
    }
    setState(() => isLoading = false);
  }

  Future<void> continueButton(String pin) async {
    if (isLoading) return;

    if (!codeSent) {
      context.showSnackBar('Lütfen önce kod gönderin', isError: true);
      return;
    }

    if (pin.isEmpty) {
      context.showSnackBar('Lütfen önce kod girin', isError: true);
      return;
    }

    if (pin.length < 4) {
      context.showSnackBar('Kod 4 haneli degil lannn', isError: true);
      return;
    }

    setState(() {
      isLoading = true;
      hasError = false;
      enabledPinput = false;
    });
    try {
      if (widget.params.isSignUp!) {
        await verifySignUpOtp();
      } else {
        await verifySignInOtp();
      }
    } on Exception catch (e) {
      if (mounted) {
        context.showSnackBar(e.toString(), isError: true);
      }
      setState(() => hasError = true);
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
          enabledPinput = true;
        });
      }
    }
  }

  Future<void> verifySignUpOtp() async {
    final verifyResult = await locator.firebaseOtpService.verifyOtp(
      tempUserId: widget.params.tempUserId,
      otp: pinController.text,
    );
    if (verifyResult) {
      if (!mounted) return;
      context.read<AuthBloc>().add(
        AuthSignUpRequested(
          email: widget.params.email,
          password: widget.params.password,
          fullName: widget.params.fullName,
        ),
      );
      if (!mounted) return;
      context.goNamed(AppStrings.routerHomeView);
    } else {
      if (!mounted) return;
      context.showSnackBar(
        'OTP doğrulama başarısız. Lütfen tekrar deneyin.',
        isError: true,
      );
    }
  }

  Future<void> verifySignInOtp() async {
    final verifyResult = await locator.firebaseOtpService.verifyOtp(
      tempUserId: widget.params.tempUserId,
      otp: pinController.text,
    );
    if (verifyResult) {
      if (!mounted) return;
      context.goNamed(AppStrings.routerHomeView);
    } else {
      if (!mounted) return;
      context.showSnackBar(
        'OTP doğrulama başarısız. Lütfen tekrar deneyin.',
        isError: true,
      );
    }
  }
}
