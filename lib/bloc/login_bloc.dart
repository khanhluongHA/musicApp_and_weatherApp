import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/config/save_data.dart';
import 'package:test_bloc/models/user_model.dart';
part 'login_event.dart';
part 'login_state.dart';

List<UserModel> itemUsers = [UserModel(userName: 'abc', password: '123')];
final formKey = GlobalKey<FormState>();

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<AuthLogin>(authLogin);
    on<Logout>(logout);
  }

  void authLogin(AuthLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        user: UserModel(userName: event.name, password: event.pass)));
    for (int i = 0; i < itemUsers.length; i++) {
      if (itemUsers[i].userName == state.user!.userName &&
          itemUsers[i].password == state.user!.password) {
        emit(state.copyWith(isLogin: true));

        printGreen('Tài khoản chính xác');

        // Obtain shared preferences.
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool(SaveData.saveIsLogIn, true);
        sharedPreferences.setString(
            SaveData.saveUserName, state.user!.userName);
        sharedPreferences.setString(
            SaveData.savePassword, state.user!.password);
      } else {
        emit(state.copyWith(isLogin: false));
      }
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
