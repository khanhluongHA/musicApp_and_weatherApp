import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/login_bloc.dart';
import 'package:test_bloc/screens/home_app.dart';
import 'package:test_bloc/widgets/custom_textfield_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // @override
  // void dispose() {
  //   userNameController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final LoginBloc blocRead = context.read<LoginBloc>();
    return Scaffold(
      body: Center(
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                    onPressed: () async {
                      blocRead.add(AuthLogin(
                          userNameController.text, passwordController.text));
                      blocRead.add(const CheckUser());
                      if (state.isLogin) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeApp()));
                      }
                    },
                    child: const Text('Login')))
          ],
        );
      })),
    );
  }
}

Future<void> _showAlertDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: Text('Tài khoản mật khẩu không chính xác',
            style: TextStyle(color: Colors.red), textAlign: TextAlign.center),
        content: const SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Xác nhận để thoát?'),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
// --- Button Widget --- //
