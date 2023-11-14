import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/register_bloc.dart';
import 'package:test_bloc/screens/login_screen.dart';
import 'package:test_bloc/widgets/custom_textfield_login.dart';
import 'package:test_bloc/widgets/show_alert_dialog.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              state.isRegister
                  ? ShowAlertDialog(
                      context: context,
                      title: 'Đăng ký thành công',
                      content: 'Nhấn ok để đăng nhập',
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    )
                  : ShowAlertDialog(
                      context: context,
                      title: 'Lỗi đăng ký',
                      content:
                          'Vui lòng kiểm tra điều kiện của username và password.',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Register',
                  style: TextStyle(color: Colors.green, fontSize: 50),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextfieldLogin(
                    labelText: 'username', controller: userNameController),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfieldLogin(
                    labelText: 'password', controller: passwordController),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfieldLogin(
                    labelText: 'confirm password',
                    controller: confirmPasswordController),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<RegisterBloc>(context).add(
                            RegisterCheck(
                              newUsername: userNameController.text,
                              newPassword: passwordController.text,
                              newConfirmPassword:
                                  confirmPasswordController.text,
                            ),
                          );
                          userNameController.text = '';
                          passwordController.text = '';
                          confirmPasswordController.text = '';
                        },
                        child: const Text('Register')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
