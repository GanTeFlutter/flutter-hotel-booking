import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:gen/gen.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignInRequested>(_authSignInRequested);
    on<AuthSignUpRequested>(_authSignUpRequested);
    on<AuthSignOutRequested>(_authSignOutRequested);
    on<AuthAnonymousSignInRequested>(_authAnonymousSignInRequested);
    on<AuthResetPasswordRequested>(_authResetPasswordRequested);
    on<AuthForgotPasswordRequested>(_authForgotPasswordRequested);
  }

  Future<void> _authForgotPasswordRequested(
    AuthForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await locator.firebaseAuthService.resetPassword(
        email: event.email,
      );
      emit(AuthPasswordResetSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Hata'));
    }
  }

  Future<void> _authResetPasswordRequested(
    AuthResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final resonse = await locator.firebaseAuthService.resetPassword(
        email: event.email,
        newPassword: event.newPassword,
      );
      emit(AuthPasswordForgotSuccess(passwordIsChanged: resonse));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Hata'));
    }
  }

  Future<void> _authAnonymousSignInRequested(
    AuthAnonymousSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await locator.firebaseAuthService.signInAnonymously();
      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Hata'));
    }
  }

  Future<void> _authSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await locator.firebaseAuthService.signOut();
      emit(AuthInitial());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Hata'));
    }
  }
 
  Future<void> _authSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await locator.firebaseAuthService.signInWithEmail(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Hata'));
    }
  }

  Future<void> _authSignUpRequested(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await locator.firebaseAuthService.signUpWithEmail(
        email: event.email,
        password: event.password,
        fullName: event.fullName,
      );
      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Hata'));
    }
  }
}
