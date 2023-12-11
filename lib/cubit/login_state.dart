// ignore_for_file: must_be_immutable

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/models/user_model.dart';

part 'login_state.g.dart';

enum LoginStatus { init, start, success, error }

@CopyWith()
class LoginCubitState extends Equatable {
  LoginCubitState(
      {this.user, this.isLogin = false, this.status = LoginStatus.init});
  final UserModel? user;
  bool isLogin;
  Enum status;

  @override
  List<Object?> get props => [user, isLogin, status];
}
