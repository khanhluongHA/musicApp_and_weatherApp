part of 'login_bloc.dart';

// ignore: must_be_immutable
class LoginState extends Equatable {
  LoginState({
    this.user,
    this.isLogin = false,
  });

  final UserModel? user;

  bool isLogin;

  LoginState copyWith({UserModel? user, bool? isLogin}) {
    return LoginState(
      user: user ?? this.user,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object?> get props => [user, isLogin];
}
