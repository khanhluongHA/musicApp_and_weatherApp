import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/login_bloc.dart';
import 'package:test_bloc/screens/home_app.dart';
import 'package:test_bloc/screens/register_screen.dart';
import 'package:test_bloc/widgets/button_submit.dart';
import 'package:test_bloc/widgets/custom_textfield_login.dart';
import 'package:test_bloc/widgets/input_password.dart';
import 'package:test_bloc/widgets/show_alert_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginBloc blocRead = context.read<LoginBloc>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.isLogin) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeApp()));
                  } else {
                    ShowAlertDialog(
                      context: context,
                      title: 'Lỗi',
                      content: 'Nhấn ok để tiếp tục đăng nhập',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
                  }
                },
                child: Form(
                  key: formKey,
                  child: Column(
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
                        labelText: 'username',
                        controller: userNameController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputPassword(
                        labelText: 'Password',
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 40,
                        child: ButtonSubmit(
                            textButton: 'Đăng nhập',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                blocRead.add(
                                  AuthLogin(userNameController.text,
                                      passwordController.text),
                                );
                                userNameController.text = '';
                                passwordController.text = '';
                              }
                            }),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        // width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Bạn chưa có tài khoản ?'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: const Text('Đăng ký'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
