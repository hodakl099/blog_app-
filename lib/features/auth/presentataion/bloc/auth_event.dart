part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSignUp extends AuthEvent {
  final String name;
  final String email;
  final String passowrd;

  AuthSignUp({required this.name, required this.email, required this.passowrd});
}
