import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/bloc/weather_state.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/models/main_list_weather.dart';
import 'package:test_bloc/network/fetch_api.dart';


part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherState()) {
    on<GetDataWeatherEvent>(getDataWeather);
  }
  Future<void> getDataWeather(
      WeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.start));
    List<MainWeather> result = [];
    final data = await FetchApi.getWeather('21.0278', '105.8342');
    final list = data['list'];
    late MainWeather item;

    for (int i = 0; i < list.length; i++) {
      late final mapMain;
      mapMain = list[i]['main'];
      item = MainWeather.fromJson(mapMain);
      print(item.temp);
      result.add(item);
    }
    emit(state.copyWith(status: WeatherStatus.success, dataWeather: result));
    printGreen(state.dataWeather.length.toString());
  }
}
