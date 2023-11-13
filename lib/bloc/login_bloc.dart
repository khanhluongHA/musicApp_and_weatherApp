import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/models/user_model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<AuthLogin>(authLogin);
  }

  void authLogin(AuthLogin event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        user: UserModel(userName: event.name, password: event.pass)));
    print(state.user!.userName);
    print(state.user!.password);
  }
}
