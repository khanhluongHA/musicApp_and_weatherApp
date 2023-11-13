import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'username: ',
                style: TextStyle(color: Colors.green, fontSize: 50),
              ),
              Text(
                'password: ',
                style: TextStyle(color: Colors.red, fontSize: 50),
              ),
            ]),
      ),
    );
  }
}
