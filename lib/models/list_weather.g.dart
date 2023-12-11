// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListWeather _$ListWeatherFromJson(Map<String, dynamic> json) => ListWeather(
      dt: json['dt'] as int,
      main: json['main'] as Map<String, dynamic>,
      weather: json['weather'] as List<dynamic>,
      clouds: json['clouds'] as Map<String, dynamic>,
      wind: json['wind'] as Map<String, dynamic>,
      visibility: json['visibility'] as int,
      pop: json['pop'] as int,
      sys: json['sys'] as Map<String, dynamic>,
      dt_txt: json['dt_txt'] as String,
    );

Map<String, dynamic> _$ListWeatherToJson(ListWeather instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys,
      'dt_txt': instance.dt_txt,
    };
