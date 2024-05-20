import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpuseCase _userSignUp;
  AuthBloc({required UserSignUpuseCase userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignUp.authRepository.singUpWithEmailPassword(
          name: event.name, email: event.email, password: event.passowrd);

      res.fold((error) => AuthFailure(message: error.message),
          (uid) => AuthSuccess(uid: uid));
    });
  }
}
