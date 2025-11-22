import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/enum/firebase_endpoint.dart';
import 'package:http/http.dart' as http;

class FirebaseOtpService {
  static const Duration _timeout = Duration(seconds: 30);

  Future<bool> sendOtp({
    required String email,
    required String tempUserId,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse(FirebaseEndpoint.sendOtp.url),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': email,
              'userId': tempUserId,
            }),
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return data['success'] == true;
      }

      // Hata durumu
      debugPrint('--❌ OTP gönderme hatası: ${response.statusCode}');
      debugPrint('--Response: ${response.body}');
      return false;
    } on http.ClientException catch (e) {
      // Network hatası
      debugPrint('--❌ Network hatası: $e');
      return false;
    } on FormatException catch (e) {
      // JSON parse hatası
      debugPrint('--❌ JSON parse hatası: $e');
      return false;
    } on Exception catch (e) {
      // Diğer hatalar
      debugPrint('--❌ Beklenmeyen hata: $e');
      return false;
    }
  }

  Future<void> verifyOtp({
    required String email,
    required String tempUserId,
    required String otp,
  }) async {}
}
