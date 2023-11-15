import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/login_bloc.dart';
import 'package:test_bloc/screens/home_app.dart';
import 'package:test_bloc/screens/register_screen.dart';
import 'package:test_bloc/widgets/custom_textfield_login.dart';
import 'package:test_bloc/widgets/input_password.dart';
import 'package:test_bloc/widgets/show_alert_dialog.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isUser = false;
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    final LoginBloc blocRead = context.read<LoginBloc>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
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
                },
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
                      onChanged: () {
                        if (userNameController.text.length > 5) {
                          setState(() {
                            isUser = true;
                          });
                        } else {
                          setState(() {
                            isUser = false;
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputPassword(
                      labelText: 'Password',
                      controller: passwordController,
                      onChanged: () {
                        if (passwordController.text.length > 5) {
                          setState(() {
                            isPassword = true;
                          });
                        } else {
                          setState(() {
                            isPassword = false;
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                getColorButton(isUser, isPassword)),
                        onPressed: () {
                          blocRead.add(AuthLogin(userNameController.text,
                              passwordController.text));
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
                ))),
      ),
    );
  }
}

Color? getColorButton(bool isUser, bool isPass) {
  if (isUser == true && isPass == true) {
    return Colors.green;
  } else {
    return Colors.red.withOpacity(0.6);
  }
}
