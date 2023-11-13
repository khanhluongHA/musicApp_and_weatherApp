import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<AuthLogin>(authLogin);
  }

  void authLogin(AuthLogin event, Emitter<LoginState> emit) {

    emit(state.copyWith(userName: event.name, password: event.pass));
    print(state.userName);
    print(state.password);
  }
}
