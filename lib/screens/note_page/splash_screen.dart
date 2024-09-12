import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/config/save_data.dart';
import 'package:test_bloc/screens/note_page/home_app.dart';

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

    Timer(const Duration(seconds: 3), () {
      if (isLogin != null) {
        if (isLogin) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeApp()));
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeApp()));
        }
      } else {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomeApp()));
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
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/hello.json',
              fit: BoxFit.fill, width: 200, height: 300),
        ],
      )),
    );
  }
}
