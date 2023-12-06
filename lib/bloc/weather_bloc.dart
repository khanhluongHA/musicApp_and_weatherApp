import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_bloc/bloc/weather_state.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/models/location_model.dart';
import 'package:test_bloc/models/main_list_weather.dart';
import 'package:test_bloc/network/fetch_api.dart';

part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherState()) {
    on<GetDataWeatherEvent>(getDataWeather);
    on<GetLocation>(getLocation);
  }
  Future<void> getDataWeather(
      WeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.start));
    List<MainWeather> result = [];
    final data = state.isSearch
        ? await FetchApi.getWeather(state.lat.toString(), state.lon.toString())
        : await FetchApi.getWeather('21.0278', '105.8342');
    final list = data['list'];
    late MainWeather item;

    for (int i = 0; i < list.length; i++) {
      // ignore: prefer_typing_uninitialized_variables
      late final mapMain;
      mapMain = list[i]['main'];
      item = MainWeather.fromJson(mapMain);

      result.add(item);
    }
    if (!state.isSearch) {
      emit(state.copyWith(city: 'Hà Nội'));
    }
    emit(state.copyWith(
      status: WeatherStatus.success,
      dataWeather: result,
    ));
    printGreen(state.dataWeather[0].temp.toString());
  }

  Future<void> getLocation(
      GetLocation event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.start));
    final data = await FetchApi.getLocation(event.city);
    if (data.isNotEmpty) {
      final map = data[0];
      final LocationModel item;
      item = LocationModel.fromJson(map);
      emit(state.copyWith(
          lat: item.lat,
          lon: item.lon,
          city: event.city,
          isSearch: true,
          status: WeatherStatus.success));
      printYellow(state.lat.toString());
      printYellow(state.lon.toString());
    } else {
      Fluttertoast.showToast(
          msg: "Thành phố không tồn tại!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
