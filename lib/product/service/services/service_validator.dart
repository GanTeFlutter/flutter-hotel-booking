import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';

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
      return AppStrings.validatorUsernameEmpty;
    }
    if (value.length < 4) {
      return AppStrings.validatorUsernameMin;
    }
    if (value.length > 20) {
      return AppStrings.validatorUsernameMax;
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return AppStrings.validatorUsernameInvalid;
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
      return AppStrings.validatorEmailEmpty;
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return AppStrings.validatorEmailInvalid;
    }

    if (value.contains(' ')) {
      return AppStrings.validatorEmailSpace;
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
      return AppStrings.validatorPasswordEmpty;
    }
    if (value.length < 6) {
      return AppStrings.validatorPasswordMin;
    }
    if (value.length > 20) {
      return AppStrings.validatorPasswordMax;
    }
    return null;
  }
}
