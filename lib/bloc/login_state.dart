part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({this.userName = '', this.password = ''});

  final String userName;
  final String password;

  LoginState copyWith({
    String? userName,
    String? password,
  }) {
    return LoginState(
        userName: userName ?? this.userName,
        password: password ?? this.password);
  }

  @override
  List<Object> get props => [userName, password];
}
