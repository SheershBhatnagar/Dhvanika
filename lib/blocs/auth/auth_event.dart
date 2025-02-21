part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested({
    required this.email,
    required this.password,
  });

  List<Object?> get props => [email, password];
}

class CreateAccountRequested extends AuthEvent {
  final String email;
  final String password;

  CreateAccountRequested({
    required this.email,
    required this.password,
  });

  List<Object?> get props => [email, password];
}

class SignOutRequested extends AuthEvent {}

class CheckAuthStatus extends AuthEvent {}
