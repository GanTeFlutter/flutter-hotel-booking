import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/login/otp/enter_otp_view.dart';
import 'package:flutter_hotel_booking/product/service/firebase/login/firebase_otp_service.dart';

abstract class EnterOtpViewModel extends State<EnterOtpView> {
  late final FirebaseOtpService _firebaseOtpService;
  final pinController = TextEditingController();
  String? errorMessage;
  late String dbpin;

  bool enabledPinput = true;
  bool circular = false;
  bool enabledButton = false;

  bool codeSent = false;

  @override
  void initState() {
    super.initState();
    _firebaseOtpService = FirebaseOtpService();
    sendCode();
  }

  String? validatePin(String? pin) {
    if (pin != null && pin.length == 4 && pin != dbpin) {
      return 'Yanlış PIN';
    }
    return null;
  }

  Future<bool> sendCode() async {
    final response = await _firebaseOtpService.sendOtp(
      email: widget.params.email,
      tempUserId: widget.params.tempUserId,
    );
    if (response) {
      codeSent = true;
      debugPrint('--✅ OTP başarıyla gönderildi');
    } else if (!response) {
      debugPrint('--❌ OTP gönderilemedi');
      codeSent = false;
    }
    return response;
  }

  Future<void> verifyOtp() async {
    await _firebaseOtpService.verifyOtp(
      email: widget.params.email,
      tempUserId: widget.params.tempUserId,
      otp: pinController.text,
    );
  }

  Future<void> continueButton() async {}
  Future<void> resendCodeButton() async {}
}
