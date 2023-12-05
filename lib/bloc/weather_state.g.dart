// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeatherStateCWProxy {
  WeatherState dataWeather(List<MainWeather> dataWeather);

  WeatherState status(Enum status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherState call({
    List<MainWeather>? dataWeather,
    Enum? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeatherState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeatherState.copyWith.fieldName(...)`
class _$WeatherStateCWProxyImpl implements _$WeatherStateCWProxy {
  final WeatherState _value;

  const _$WeatherStateCWProxyImpl(this._value);

  @override
  WeatherState dataWeather(List<MainWeather> dataWeather) =>
      this(dataWeather: dataWeather);

  @override
  WeatherState status(Enum status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherState call({
    Object? dataWeather = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return WeatherState(
      dataWeather:
          dataWeather == const $CopyWithPlaceholder() || dataWeather == null
              ? _value.dataWeather
              // ignore: cast_nullable_to_non_nullable
              : dataWeather as List<MainWeather>,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as Enum,
    );
  }
}

extension $WeatherStateCopyWith on WeatherState {
  /// Returns a callable class that can be used as follows: `instanceOfWeatherState.copyWith(...)` or like so:`instanceOfWeatherState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeatherStateCWProxy get copyWith => _$WeatherStateCWProxyImpl(this);
}
