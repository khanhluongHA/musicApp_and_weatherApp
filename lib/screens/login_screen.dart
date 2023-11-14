import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/login_bloc.dart';
import 'package:test_bloc/screens/home_app.dart';
import 'package:test_bloc/screens/register_screen.dart';
import 'package:test_bloc/widgets/custom_textfield_login.dart';
import 'package:test_bloc/widgets/show_alert_dialog.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  void login() {}
  @override
  Widget build(BuildContext context) {
    final LoginBloc blocRead = context.read<LoginBloc>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(child:
            BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Login',
                style: TextStyle(color: Colors.green, fontSize: 50),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextfieldLogin(
                  labelText: 'username', controller: userNameController),
              const SizedBox(
                height: 30,
              ),
              CustomTextfieldLogin(
                  labelText: 'password', controller: passwordController),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    blocRead.add(AuthLogin(
                        userNameController.text, passwordController.text));
                    blocRead.add(const CheckUser());

                    state.isLogin
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeApp()))
                        : ShowAlertDialog(
                            context: context,
                            title: 'Tài khoản mật khẩu không chính xác',
                            content: 'Xác nhận để thoát',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );

                    userNameController.text = '';
                    passwordController.text = '';
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                // width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Bạn chưa có tài khoản ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text('Đăng ký'),
                    )
                  ],
                ),
              )
            ],
          );
        })),
      ),
    );
  }
}
