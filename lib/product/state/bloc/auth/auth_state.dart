part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  AuthSuccess(this.user);
  final UserModel user;
}

final class AuthError extends AuthState {
  AuthError(this.message);
  final String message;
}
