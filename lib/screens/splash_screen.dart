import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/config/save_data.dart';
import 'package:test_bloc/screens/home_app.dart';
import 'package:test_bloc/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getDataLogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var isLogin = sharedPreferences.getBool(SaveData.saveIsLogIn);

    Timer(const Duration(seconds: 2), () {
      if (isLogin != null) {
        if (isLogin) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeApp()));
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      } else {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDataLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.man,
                size: 50,
              ),
            ),
          )
        ],
      )),
    );
  }
}
