import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/bloc/login_bloc.dart';
import 'package:test_bloc/config/save_data.dart';
import 'package:test_bloc/screens/login_screen.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String userName = '';
  String password = '';

  void _getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      userName = sharedPreferences.getString(SaveData.saveUserName) ?? '';
      password = sharedPreferences.getString(SaveData.savePassword) ?? '';
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoginBloc blocRead = context.read<LoginBloc>();

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'username: $userName',
                  style: const TextStyle(color: Colors.green, fontSize: 25),
                ),
                Text(
                  'password: $password',
                  style: const TextStyle(color: Colors.red, fontSize: 25),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      blocRead.add(Logout());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  LoginScreen()));
                    },
                    child: const Text('Thoát'))
              ]),
        ),
      ),
    );
  }
}
