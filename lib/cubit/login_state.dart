part of 'login_cubit.dart';

// ignore: must_be_immutable
class LoginCubitState extends Equatable {
  LoginCubitState({
    this.user,
    this.isLogin = false,
  });
  final UserModel? user;
  bool isLogin;

  LoginCubitState copyWith({UserModel? user, bool? isLogin}) {
    return LoginCubitState(
      user: user ?? this.user,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object?> get props => [user, isLogin];
}
