part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetDataWeatherEvent extends WeatherEvent {}

class GetLocation extends WeatherEvent {
  final String city;
  const GetLocation({required this.city});
}
