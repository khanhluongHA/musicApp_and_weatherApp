import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_bloc/bloc/weather_bloc.dart';
import 'package:test_bloc/bloc/weather_state.dart';
import 'package:test_bloc/config/app_color.dart';
import 'package:test_bloc/config/app_size.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/screens/note_page/home_app.dart';
import 'package:test_bloc/screens/weather_page/search_city.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<String> days = [];

  List<int> weather5day = [1, 9, 17, 25, 33];

  late WeatherBloc weatherBloc;

  void getLastDays() {
    var time = DateTime.now();
    for (int i = 0; i < 5; i++) {
      var lastDay = time.add(Duration(days: i));
      var day = DateFormat('d/M/yyyy').format(lastDay);
      // var day = lastDay.toString().split(' ');
      days.add(day);
    }
  }

  @override
  void initState() {
    days.clear();
    weatherBloc = context.read<WeatherBloc>();
    weatherBloc.add(GetDataWeatherEvent());
    printRed(weatherBloc.state.dataWeather.length.toString());

    getLastDays();
    printCyan(days.toString());

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
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeApp()));
                            },
                            child: Icon(Icons.arrow_back)),
                        const Text(
                          'Weather app',
                          style: TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchCity()));
                            },
                            child: const SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(Icons.search))),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          weatherBloc.state.city,
                          style: const TextStyle(
                              color: AppColors.white, fontSize: AppSize.size30),
                        ),
                        Text(
                          ' ${weatherBloc.state.dataWeather[1].temp.ceil()}°',
                          style: const TextStyle(
                              color: AppColors.white,
                              fontSize: AppSize.size90,
                              fontWeight: FontWeight.w200),
                        ),
                        Text(
                          'T:${weatherBloc.state.dataWeather[1].temp_min.ceil() - 3}°   C:${weatherBloc.state.dataWeather[1].temp_max.ceil() + 2}°',
                          style: const TextStyle(
                              color: AppColors.white, fontSize: AppSize.size20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Độ ẩm: ${weatherBloc.state.dataWeather[0].humidity}% ',
                          style: const TextStyle(
                              color: AppColors.white, fontSize: AppSize.size20),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dự báo thời tiết 5 ngày',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                            height: 10,
                          );
                        },
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                right: 8, left: 8, top: 30, bottom: 10),
                            width: 130,
                            height: 180,
                            decoration: BoxDecoration(
                                color: const Color(0xff9BB8CD),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${days[index]}',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${weatherBloc.state.dataWeather[weather5day[index]].temp_min.ceil() - 3}°',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text('-'),
                                    Text(
                                      '${weatherBloc.state.dataWeather[weather5day[index]].temp_max.ceil() + 2}°',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Độ ẩm: ${weatherBloc.state.dataWeather[weather5day[index]].humidity}% ',
                                  style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: AppSize.size10),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
