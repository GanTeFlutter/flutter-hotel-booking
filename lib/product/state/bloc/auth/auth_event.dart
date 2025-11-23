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

/// Misafir (anonim) kullanıcı olarak giriş yapmak için tetiklenir.
/// Email veya şifre gerektirmez.
/// Firebase otomatik olarak bir UID oluşturur.
class AuthSignInAsGuestRequested extends AuthEvent {}

/// Şifre sıfırlama maili göndermek için tetiklenir.
///
/// [email] - Şifre sıfırlanacak hesabın email adresi
class AuthPasswordResetRequested extends AuthEvent {
  const AuthPasswordResetRequested(this.email);
  final String email;
}

// ============================================================
// OTP EVENTS (Genel Kullanım)
// ============================================================

/// [email] - OTP kodu gönderilecek email adresi
/// [tempUserId] - Geçici kullanıcı ID'si ()
class AuthOtpSendRequested extends AuthEvent {
  const AuthOtpSendRequested({
    required this.email,
    required this.tempUserId,
  });
  final String email;
  final String tempUserId;
}

/// [tempUserId] - OTP gönderilirken kullanılan ID
/// [otp] - Kullanıcının girdiği 4 haneli doğrulama kodu
class AuthOtpVerifyRequested extends AuthEvent {
  const AuthOtpVerifyRequested({
    required this.tempUserId,
    required this.otp,
  });
  final String tempUserId;
  final String otp;
}

class AuthOtpResendRequested extends AuthEvent {
  const AuthOtpResendRequested({
    required this.tempUserId,
    required this.email,
  });
  final String tempUserId;
  final String email;
}

/// OTP doğrulama süresinin dolması durumu
class AuthOtpExpired extends AuthEvent {
  const AuthOtpExpired(this.tempUserId);
  final String tempUserId;
}

/// OTP işlemini iptal etmek için
class AuthOtpCancelled extends AuthEvent {}

/// Social (Google, Facebook vb.) ile giriş yapmak için tetiklenir.
///
/// Sosyal Medya Login Event'leri (kullanıyorsanız)
class AuthGoogleSignInRequested extends AuthEvent {}

class AuthAppleSignInRequested extends AuthEvent {}

class AuthFacebookSignInRequested extends AuthEvent {}
