import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/cubit/login_cubit.dart';
import 'package:test_bloc/models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit() : super(const RegisterCubitState());

  void registerCheck(
      {required String userName,
      required String password,
      required String confirmPassword}) {
    emit(
      state.copyWith(
        username: userName.trim(),
        password: password,
        confirmPassword: confirmPassword,
      ),
    );

    // kiểm tra password và username có đáp ứng đủ đk ko
    if (state.password == state.confirmPassword) {
      users.add(UserModel(userName: userName, password: password));

      emit(state.copyWith(isRegister: true));
    } else {
      emit(state.copyWith(isRegister: false));
    }
  }
}
