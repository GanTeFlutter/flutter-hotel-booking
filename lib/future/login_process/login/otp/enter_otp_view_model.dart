import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/login/otp/enter_otp_view.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/extension/show_snackbar.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firebase_auth/firebase_auth_service.dart';

import 'package:flutter_hotel_booking/product/service/firebase/login/firebase_otp_service.dart';

import 'package:flutter_hotel_booking/product/state/cubit/countdown/countdown_cubit.dart';

abstract class EnterOtpViewModel extends State<EnterOtpView> {
  late final FirebaseOtpService _firebaseOtpService;
  late final FirebaseAuthService _firebaseAuthService;
  late final TextEditingController pinController;

  bool isLoading = false;
  bool codeSent = false;
  bool hasError = false;

  bool enabledPinput = true;

  @override
  void initState() {
    super.initState();
    _firebaseOtpService = FirebaseOtpService();
    _firebaseAuthService = FirebaseAuthService();
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

  Future<void> continueButton(String pin) async {}
}
