// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeatherStateCWProxy {
  WeatherState city(String city);

  WeatherState dataWeather(List<MainWeather> dataWeather);

  WeatherState isSearch(bool isSearch);

  WeatherState lat(double lat);

  WeatherState lon(double lon);

  WeatherState status(Enum status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherState call({
    String? city,
    List<MainWeather>? dataWeather,
    bool? isSearch,
    double? lat,
    double? lon,
    Enum? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeatherState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeatherState.copyWith.fieldName(...)`
class _$WeatherStateCWProxyImpl implements _$WeatherStateCWProxy {
  final WeatherState _value;

  const _$WeatherStateCWProxyImpl(this._value);

  @override
  WeatherState city(String city) => this(city: city);

  @override
  WeatherState dataWeather(List<MainWeather> dataWeather) =>
      this(dataWeather: dataWeather);

  @override
  WeatherState isSearch(bool isSearch) => this(isSearch: isSearch);

  @override
  WeatherState lat(double lat) => this(lat: lat);

  @override
  WeatherState lon(double lon) => this(lon: lon);

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
    Object? city = const $CopyWithPlaceholder(),
    Object? dataWeather = const $CopyWithPlaceholder(),
    Object? isSearch = const $CopyWithPlaceholder(),
    Object? lat = const $CopyWithPlaceholder(),
    Object? lon = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return WeatherState(
      city: city == const $CopyWithPlaceholder() || city == null
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String,
      dataWeather:
          dataWeather == const $CopyWithPlaceholder() || dataWeather == null
              ? _value.dataWeather
              // ignore: cast_nullable_to_non_nullable
              : dataWeather as List<MainWeather>,
      isSearch: isSearch == const $CopyWithPlaceholder() || isSearch == null
          ? _value.isSearch
          // ignore: cast_nullable_to_non_nullable
          : isSearch as bool,
      lat: lat == const $CopyWithPlaceholder() || lat == null
          ? _value.lat
          // ignore: cast_nullable_to_non_nullable
          : lat as double,
      lon: lon == const $CopyWithPlaceholder() || lon == null
          ? _value.lon
          // ignore: cast_nullable_to_non_nullable
          : lon as double,
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
