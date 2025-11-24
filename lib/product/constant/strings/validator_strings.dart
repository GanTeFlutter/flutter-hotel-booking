import 'package:flutter/material.dart';

@immutable
final class ValidatorStrings {
  const ValidatorStrings._();

  // Username
  static const String usernameEmpty = 'İsim boş olamaz';
  static const String usernameMin = 'En az 4 karakter';
  static const String usernameMax = 'En fazla 20 karakter';
  static const String usernameInvalid = 'Sadece harf, rakam ve _ kullanın';

  // Email
  static const String emailEmpty = 'Email boş olamaz';
  static const String emailInvalid = 'Geçerli bir email girin';
  static const String emailSpace = 'Email boşluk içeremez';

  // Password
  static const String passwordEmpty = 'Şifre boş olamaz';
  static const String passwordMin = 'En az 6 karakter';
  static const String passwordMax = 'En fazla 20 karakter';
}
