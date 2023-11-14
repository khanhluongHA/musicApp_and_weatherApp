part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterCheck extends RegisterEvent {
  const RegisterCheck(
      {this.newUsername = '',
      this.newPassword = '',
      this.newConfirmPassword = ''});

  final String newUsername;
  final String newPassword;
  final String newConfirmPassword;
}
