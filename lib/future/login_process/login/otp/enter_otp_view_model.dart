import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/login/otp/enter_otp_view.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/extension/show_snackbar.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firebase_auth/firebase_auth_service.dart';

import 'package:flutter_hotel_booking/product/service/firebase/login/firebase_otp_service.dart';

import 'package:flutter_hotel_booking/product/state/cubit/countdown/countdown_cubit.dart';
import 'package:go_router/go_router.dart';

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

  Future<void> continueButton(String pin) async {
    //  Zaten loading'de mi kontrolü
    if (isLoading) {
      return;
    }
    if (!codeSent) {
      context.showSnackBar('Lütfen önce kod gönderin', isError: true);
      hasError = true;
      setState(() {});
      return;
    }

    // 1. Pin uzunluk kontrolü
    if (pin.length != 4) {
      context.showSnackBar('Kod 4 haneli olmalıdır', isError: true);
      hasError = true;
      setState(() {});
      return;
    }

    // 5. Pin boş mu kontrolü (ekstra güvenlik)
    if (pin.trim().isEmpty) {
      context.showSnackBar('Lütfen kodu giriniz', isError: true);
      hasError = true;
      setState(() {});
      return;
    }

    setState(() {
      isLoading = true;
      enabledPinput = false;
      hasError = false;
    });

    context.showSnackBar('Kod doğrulanıyor...');

    try {
      final verifyResult = await _firebaseOtpService.verifyOtp(
        tempUserId: widget.params.tempUserId,
        otp: pin,
      );
      if (!verifyResult) {
        setState(() {
          hasError = true;
        });
        if (mounted) {
          context.showSnackBar(
            'Geçersiz kod. Lütfen tekrar deneyin.',
            isError: true,
          );
        }
        return;
      }

      // OTP doğrulandıktan sonra kullanıcı oluşturma
      await _firebaseAuthService.createUser(
        email: widget.params.email,
        password: widget.params.password,
        fullName: widget.params.fullName,
      );

      if (mounted) {
        context
          ..showSnackBar('Kullanıcı başarıyla oluşturuldu!')
          ..goNamed(AppStrings.routerHomeView);
      }
    } on Exception catch (e) {
      if (mounted) {
        context.showSnackBar(
          'Bir hata oluştu: $e',
          isError: true,
        );
      }
    } finally {
      setState(() {
        isLoading = false;
        enabledPinput = true;
      });
    }
  }
}
