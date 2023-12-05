// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WaterStateCWProxy {
  WaterState a(int a);

  WaterState ids(List<String> ids);

  WaterState status(Enum status);

  WaterState waterMap(Map<String, dynamic>? waterMap);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WaterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WaterState(...).copyWith(id: 12, name: "My name")
  /// ````
  WaterState call({
    int? a,
    List<String>? ids,
    Enum? status,
    Map<String, dynamic>? waterMap,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWaterState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWaterState.copyWith.fieldName(...)`
class _$WaterStateCWProxyImpl implements _$WaterStateCWProxy {
  final WaterState _value;

  const _$WaterStateCWProxyImpl(this._value);

  @override
  WaterState a(int a) => this(a: a);

  @override
  WaterState ids(List<String> ids) => this(ids: ids);

  @override
  WaterState status(Enum status) => this(status: status);

  @override
  WaterState waterMap(Map<String, dynamic>? waterMap) =>
      this(waterMap: waterMap);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WaterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WaterState(...).copyWith(id: 12, name: "My name")
  /// ````
  WaterState call({
    Object? a = const $CopyWithPlaceholder(),
    Object? ids = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? waterMap = const $CopyWithPlaceholder(),
  }) {
    return WaterState(
      a: a == const $CopyWithPlaceholder() || a == null
          ? _value.a
          // ignore: cast_nullable_to_non_nullable
          : a as int,
      ids: ids == const $CopyWithPlaceholder() || ids == null
          ? _value.ids
          // ignore: cast_nullable_to_non_nullable
          : ids as List<String>,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as Enum,
      waterMap: waterMap == const $CopyWithPlaceholder()
          ? _value.waterMap
          // ignore: cast_nullable_to_non_nullable
          : waterMap as Map<String, dynamic>?,
    );
  }
}

extension $WaterStateCopyWith on WaterState {
  /// Returns a callable class that can be used as follows: `instanceOfWaterState.copyWith(...)` or like so:`instanceOfWaterState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WaterStateCWProxy get copyWith => _$WaterStateCWProxyImpl(this);
}
