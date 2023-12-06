import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/weather_bloc.dart';
import 'package:test_bloc/bloc/weather_state.dart';
import 'package:test_bloc/config/app_color.dart';
import 'package:test_bloc/config/app_size.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/screens/weather_page/search_city.dart';

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
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Weather app'),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchCity()));
                  },
                  child: const SizedBox(
                      width: 40, height: 40, child: Icon(Icons.search))),
            ],
          ),
        ),
        backgroundColor: const Color(0xFF8ACDD7),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: weatherBloc,
          builder: (context, state) {
            if (weatherBloc.state.dataWeather.isEmpty) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: CircularProgressIndicator())],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${weatherBloc.state.city}',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: AppSize.size30),
                          ),
                          Text(
                            ' ${weatherBloc.state.dataWeather[0].temp.ceil()}°',
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
