import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/models/user_model.dart';
part 'login_event.dart';
part 'login_state.dart';

List<UserModel> itemUsers = [UserModel(userName: 'abc', password: '123')];

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<AuthLogin>(authLogin);
    on<CheckUser>(checkUser);
  }

  void authLogin(AuthLogin event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        user: UserModel(userName: event.name, password: event.pass)));
    print(state.user!.userName);
    print(state.user!.password);
    print('heheh');
  }

  void checkUser(CheckUser event, Emitter<LoginState> emit) {
    for (int i = 0; i < itemUsers.length; i++) {
      print(i);
      if (itemUsers[i].userName == state.user!.userName &&
          itemUsers[i].password == state.user!.password) {
        emit(state.copyWith(isLogin: true));
        print('Tài khoản chính xác');
      }
    }
  }
}
