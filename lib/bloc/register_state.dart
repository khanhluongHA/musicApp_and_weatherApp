part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.isUserName = false,
    this.isPassword = false,
    this.isRegister = false,
  });

  final String username;
  final String password;
  final String confirmPassword;
  final bool isUserName;
  final bool isPassword;
  final bool isRegister;

  RegisterState copyWith(
      {String? username,
      String? password,
      String? confirmPassword,
      bool? isUserName,
      bool? isPassword,
      bool? isRegister}) {
    return RegisterState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isUserName: isUserName ?? this.isUserName,
      isPassword: isPassword ?? this.isPassword,
      isRegister: isRegister ?? this.isRegister,
    );
  }

  @override
  List<Object> get props =>
      [username, password, confirmPassword, isUserName, isPassword, isRegister];
}
