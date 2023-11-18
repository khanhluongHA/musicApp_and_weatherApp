import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/bloc/login_bloc.dart';
import 'package:test_bloc/bloc/note_bloc.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/models/user_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterCheck>(registerCheck);
  }

  void registerCheck(RegisterCheck event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        username: event.newUsername.trim(),
        password: event.newPassword,
        confirmPassword: event.newConfirmPassword,
      ),
    );

    // kiểm tra password và username có đáp ứng đủ đk ko
    if (state.password == state.confirmPassword) {
      itemUsers.add(
          UserModel(userName: event.newUsername, password: event.newPassword));
      printGreen(itemUsers.length.toString());

      emit(state.copyWith(isRegister: true));
    } else {
      emit(state.copyWith(isRegister: false));
    }
  }
}
