import 'package:blog_app/core/common/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(User? user) {
    if (user == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn(user));
    }

    @override
    void onChange(Change<AppUserState> change) {
      print(
          'here is the on change app user cubit, current :  ${change.currentState}, next state : ${change.nextState}');
      super.onChange(change);
    }
  }
}
