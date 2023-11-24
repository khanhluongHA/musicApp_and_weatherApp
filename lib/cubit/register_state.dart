part of 'register_cubit.dart';

class RegisterCubitState extends Equatable {
  const RegisterCubitState({
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.isRegister = false,
  });
  final String username;
  final String password;
  final String confirmPassword;
  final bool isRegister;
  RegisterCubitState copyWith(
      {String? username,
      String? password,
      String? confirmPassword,
      bool? isRegister}) {
    return RegisterCubitState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isRegister: isRegister ?? this.isRegister,
    );
  }

  @override
  List<Object> get props => [username, password, confirmPassword, isRegister];
}

