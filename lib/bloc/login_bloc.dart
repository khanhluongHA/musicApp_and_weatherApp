import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/config/save_data.dart';
import 'package:test_bloc/models/user_model.dart';
part 'login_event.dart';
part 'login_state.dart';

List<UserModel> itemUsers = [UserModel(userName: '11111', password: '22222')];

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<AuthLogin>(authLogin);
    on<Logout>(logout);
  }

  void authLogin(AuthLogin event, Emitter<LoginState> emit) async {
    for (int i = 0; i < itemUsers.length; i++) {
      if (itemUsers[i].userName == event.name.trim() &&
          itemUsers[i].password == event.pass) {
        emit(state.copyWith(isLogin: true));

        printGreen('Tài khoản chính xác');

        // Obtain shared preferences.
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool(SaveData.saveIsLogIn, true);
        sharedPreferences.setString(SaveData.saveUserName, event.name.trim());
        sharedPreferences.setString(SaveData.savePassword, event.pass);
      } else {
        emit(state.copyWith(isLogin: false));
      }
      emit(state.copyWith(
          user: UserModel(userName: event.name.trim(), password: event.pass)));
    }
  }

  void logout(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLogin: false));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove(SaveData.saveIsLogIn);
    sharedPreferences.remove(SaveData.saveUserName);
    sharedPreferences.remove(SaveData.savePassword);
  }
}
