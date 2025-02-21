import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dhvanika/api/firebase_api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAPI authService;

  AuthBloc({
    required this.authService
  }) : super(AuthInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        User? user = await authService.signInWithEmailPassword(event.email, event.password);
        if (user != null) {
          emit(Authenticated(uid: user.uid));
        } else {
          emit(AuthError(message: "Authentication failed"));
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<CreateAccountRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        User? user = await authService.createAccountWithEmailPassword(event.email, event.password);
        if (user != null) {
          emit(Authenticated(uid: user.uid));
        } else {
          emit(AuthError(message: "Authentication failed"));
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<SignOutRequested>((event, emit) {
      emit(AuthLoading());
      authService.signOut();
      emit(Unauthenticated());
    });

    on<CheckAuthStatus>((event, emit) {
      final user = authService.getCurrentUser();
      if (user != null) {
        emit(Authenticated(uid: user.uid));
      } else {
        emit(Unauthenticated());
      }
    });
  }
}
