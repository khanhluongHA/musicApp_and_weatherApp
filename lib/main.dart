import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/weather_bloc.dart';
import 'package:test_bloc/cubit/login_cubit.dart';
import 'package:test_bloc/cubit/note_cubit.dart';
import 'package:test_bloc/cubit/register_cubit.dart';
import 'package:test_bloc/cubit/water_cubit.dart';
import 'package:test_bloc/screens/note_page/splash_screen.dart';
import 'package:test_bloc/screens/note_page/water_screen.dart';

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
        BlocProvider(
          create: (context) => WaterCubit(),
        ),
        BlocProvider(
          create: (context) => WeatherBloc(),
        ),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
