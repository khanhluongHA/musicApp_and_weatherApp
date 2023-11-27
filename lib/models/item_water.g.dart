// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_water.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ItemWaterCWProxy {
  ItemWater id(String id);

  ItemWater name(String name);

  ItemWater price(int price);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemWater(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemWater(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemWater call({
    String? id,
    String? name,
    int? price,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItemWater.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItemWater.copyWith.fieldName(...)`
class _$ItemWaterCWProxyImpl implements _$ItemWaterCWProxy {
  final ItemWater _value;

  const _$ItemWaterCWProxyImpl(this._value);

  @override
  ItemWater id(String id) => this(id: id);

  @override
  ItemWater name(String name) => this(name: name);

  @override
  ItemWater price(int price) => this(price: price);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemWater(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemWater(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemWater call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
  }) {
    return ItemWater(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int,
    );
  }
}

extension $ItemWaterCopyWith on ItemWater {
  /// Returns a callable class that can be used as follows: `instanceOfItemWater.copyWith(...)` or like so:`instanceOfItemWater.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItemWaterCWProxy get copyWith => _$ItemWaterCWProxyImpl(this);
}
