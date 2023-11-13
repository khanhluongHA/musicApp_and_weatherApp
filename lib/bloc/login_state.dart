part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({this.user});

  final UserModel? user;

  LoginState copyWith({
    UserModel? user,
  }) {
    return LoginState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [user];
}
