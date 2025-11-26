part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

/// Uygulama açıldığında veya auth durumu kontrol edilmek istendiğinde tetiklenir.
class AuthCheckRequested extends AuthEvent {}

/// Email ve şifre ile giriş yapmak için tetiklenir.
/// Kayıtlı kullanıcılar için kullanılır.
///
/// [email] - Kullanıcının email adresi
/// [password] - Kullanıcının şifresi
class AuthSignInRequested extends AuthEvent {
  const AuthSignInRequested({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}

/// Yeni kullanıcı kaydı için tetiklenir.
class AuthSignUpRequested extends AuthEvent {
  const AuthSignUpRequested({
    required this.email,
    required this.password,
    required this.fullName,
  });
  final String email;
  final String password;
  final String fullName;
}

/// Mevcut kullanıcıyı çıkış yaptırmak için tetiklenir.
class AuthSignOutRequested extends AuthEvent {}

/// Anonim kullanıcı girişi yapmak için tetiklenir.
class AuthAnonymousSignInRequested extends AuthEvent {}

///Create New Password için tetiklenir.
/// Yeni şifre oluşturmak isteyen kullanıcılar için kullanılır.
class AuthResetPasswordRequested extends AuthEvent {
  const AuthResetPasswordRequested({
    this.email,
    this.newPassword,
  });

  final String? email;
  final String? newPassword;
}

class AuthForgotPasswordRequested extends AuthEvent {
  const AuthForgotPasswordRequested({
    this.email,
  });

  final String? email;
}

/// Social (Google, Facebook vb.) ile giriş yapmak için tetiklenir.
///
/// Sosyal Medya Login Event'leri (kullanıyorsanız)
class AuthGoogleSignInRequested extends AuthEvent {}

class AuthAppleSignInRequested extends AuthEvent {}

class AuthFacebookSignInRequested extends AuthEvent {}
