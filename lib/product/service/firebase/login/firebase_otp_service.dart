import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirebaseOtpService {
  static const String _baseUrl =
      'https://YOUR_REGION-YOUR_PROJECT_ID.cloudfunctions.net';

  static const Duration _timeout = Duration(seconds: 30);

  Future<bool> sendOtp({
    required String email,
    required String userId,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/sendOtp'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': email,
              'userId': userId,
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
    }on Exception catch (e) {
      // Diğer hatalar
      debugPrint('--❌ Beklenmeyen hata: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>> verifyOtp({
    required String userId,
    required String code,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/verifyOtp'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'userId': userId,
              'code': code,
            }),
          )
          .timeout(_timeout);

      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && data['success'] == true) {
        // ✅ Kod doğru
        return {
          'success': true,
          'email': data['email'] ?? '',
        };
      } else {
        // ❌ Kod yanlış veya hata
        return {
          'success': false,
          'error': data['error'] ?? 'Doğrulama başarısız',
        };
      }
    } on http.ClientException catch (e) {
      debugPrint('--❌ Network hatası: $e');
      return {
        'success': false,
        'error': 'İnternet bağlantınızı kontrol edin',
      };
    } on FormatException catch (e) {
      debugPrint('--❌ JSON parse hatası: $e');
      return {
        'success': false,
        'error': 'Sunucu hatası',
      };
    } catch (e) {
      debugPrint('--❌ Beklenmeyen hata: $e');
      return {
        'success': false,
        'error': 'Bir hata oluştu',
      };
    }
  }
}
