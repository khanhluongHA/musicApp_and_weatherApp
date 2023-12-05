import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/weather_bloc.dart';
import 'package:test_bloc/bloc/weather_state.dart';
import 'package:test_bloc/config/app_color.dart';
import 'package:test_bloc/config/app_size.dart';
import 'package:test_bloc/config/print_color.dart';


class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late WeatherBloc weatherBloc;

  @override
  void initState() {
    weatherBloc = context.read<WeatherBloc>();
    weatherBloc.add(GetDataWeatherEvent());
    printRed(weatherBloc.state.dataWeather.length.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF8ACDD7),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: weatherBloc,
          builder: (context, state) {
            if (weatherBloc.state.dataWeather.isEmpty) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: Text('dữ liệu trống'))],
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: AppSize.size30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Hà Nội',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: AppSize.size30),
                          ),
                          Text(
                            '${weatherBloc.state.dataWeather[0].temp.ceil() + 1}',
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: AppSize.size90,
                                fontWeight: FontWeight.w200),
                          ),
                          Text(
                            'C:${weatherBloc.state.dataWeather[0].temp_max.ceil() + 1}°  T:${weatherBloc.state.dataWeather[0].temp_min.ceil() - 1}°',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: AppSize.size20),
                          ),
                          Text(
                            'Độ ẩm: ${weatherBloc.state.dataWeather[0].humidity}% ',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: AppSize.size20),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
