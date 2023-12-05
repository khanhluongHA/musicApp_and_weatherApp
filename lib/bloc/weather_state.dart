import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/models/main_list_weather.dart';

part 'weather_state.g.dart';

enum WeatherStatus { init, start, success, error }

@CopyWith()
class WeatherState extends Equatable {
  const WeatherState(
      {this.dataWeather = const [], this.status = WeatherStatus.init});

  final List<MainWeather> dataWeather;
  final Enum status;

  @override
  List<Object> get props => [dataWeather, status];
}
