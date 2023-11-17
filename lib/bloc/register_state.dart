part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.isRegister = false,
  });

  final String username;
  final String password;
  final String confirmPassword;
  final bool isRegister;

  RegisterState copyWith(
      {String? username,
      String? password,
      String? confirmPassword,
      bool? isRegister}) {
    return RegisterState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isRegister: isRegister ?? this.isRegister,
    );
  }

  @override
  List<Object> get props => [username, password, confirmPassword, isRegister];
}
