part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class AuthLogin extends LoginEvent {
  const AuthLogin(this.name, this.pass);
  final String name;
  final String pass;
  @override
  List<Object> get props => [name, pass];
}

class Logout extends LoginEvent{
  
}
