import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/usecases/current_user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_log_in.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpuseCase _userSignUp;
  final UserLogInuseCase _userLogIn;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  AuthBloc(
      {required UserSignUpuseCase userSignUp,
      required UserLogInuseCase userLogIn,
      required GetCurrentUserUseCase getCurrentUserUseCase})
      : _userSignUp = userSignUp,
        _userLogIn = userLogIn,
        _getCurrentUserUseCase = getCurrentUserUseCase,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogIn>(_onAuthLogIn);
    on<IsUserLoggedIn>(_isUserLoggedIn);
  }

  void _isUserLoggedIn(IsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _getCurrentUserUseCase(NoParams());

    res.fold((error) => emit(AuthFailure(message: error.message)), (user) {
      print('here is the user data ${user.email}');
      emit(AuthSuccess(user: user));
    });
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignUp(UserSignUpParams(
      name: event.name,
      email: event.email,
      password: event.passowrd,
    ));

    res.fold(
      (error) => emit(AuthFailure(message: error.message)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  void _onAuthLogIn(AuthLogIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userLogIn(UserLogInParams(
      email: event.email,
      password: event.password,
    ));

    res.fold(
      (error) => emit(AuthFailure(message: error.message)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }
}
