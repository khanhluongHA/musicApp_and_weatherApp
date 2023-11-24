import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/login_bloc.dart';
import 'package:test_bloc/bloc/note_bloc.dart';
import 'package:test_bloc/bloc/register_bloc.dart';
import 'package:test_bloc/cubit/login_cubit.dart';
import 'package:test_bloc/cubit/note_cubit.dart';
import 'package:test_bloc/cubit/register_cubit.dart';
import 'package:test_bloc/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => NoteCubit(),
        ),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
