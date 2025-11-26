import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/strings/views/auth_strings.dart';

@immutable
final class AppValidators {
  const AppValidators._();

  /// Kullanıcı adı doğrulama
  ///
  /// Kurallar:
  /// - Boş olamaz
  /// - Minimum 4 karakter
  /// - Maksimum 20 karakter
  /// - Sadece harf, rakam ve alt çizgi (_) içerebilir
  ///
  /// Returns:
  /// - null = Geçerli
  /// - String = Hata mesajı
  static String? username(String? value) {
    if (value == null || value.isEmpty) {
      return AuthStrings.usernameEmpty;
    }
    if (value.length < 4) {
      return AuthStrings.usernameMin;
    }
    if (value.length > 20) {
      return AuthStrings.usernameMax;
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return AuthStrings.usernameInvalid;
    }
    return null;
  }

  /// Email adresi doğrulama
  ///
  /// Kurallar:
  /// - Boş olamaz
  /// - Geçerli email formatında olmalı (user@example.com)
  /// - Boşluk içeremez
  ///
  /// Returns:
  /// - null = Geçerli
  /// - String = Hata mesajı
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return AuthStrings.emailEmpty;
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return AuthStrings.emailInvalid;
    }

    if (value.contains(' ')) {
      return AuthStrings.emailSpace;
    }

    return null;
  }

  /// Şifre doğrulama
  ///
  /// Kurallar:
  /// - Boş olamaz
  /// - Minimum 6 karakter
  /// - Maksimum 20 karakter
  ///
  /// Returns:
  /// - null = Geçerli
  /// - String = Hata mesajı
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AuthStrings.passwordEmpty;
    }
    if (value.length < 6) {
      return AuthStrings.passwordMin;
    }
    if (value.length > 20) {
      return AuthStrings.passwordMax;
    }
    return null;
  }
}
