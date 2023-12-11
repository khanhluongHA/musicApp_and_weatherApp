// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginCubitStateCWProxy {
  LoginCubitState isLogin(bool isLogin);

  LoginCubitState status(Enum status);

  LoginCubitState user(UserModel? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginCubitState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginCubitState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginCubitState call({
    bool? isLogin,
    Enum? status,
    UserModel? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginCubitState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginCubitState.copyWith.fieldName(...)`
class _$LoginCubitStateCWProxyImpl implements _$LoginCubitStateCWProxy {
  final LoginCubitState _value;

  const _$LoginCubitStateCWProxyImpl(this._value);

  @override
  LoginCubitState isLogin(bool isLogin) => this(isLogin: isLogin);

  @override
  LoginCubitState status(Enum status) => this(status: status);

  @override
  LoginCubitState user(UserModel? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginCubitState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginCubitState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginCubitState call({
    Object? isLogin = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return LoginCubitState(
      isLogin: isLogin == const $CopyWithPlaceholder() || isLogin == null
          ? _value.isLogin
          // ignore: cast_nullable_to_non_nullable
          : isLogin as bool,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as Enum,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as UserModel?,
    );
  }
}

extension $LoginCubitStateCopyWith on LoginCubitState {
  /// Returns a callable class that can be used as follows: `instanceOfLoginCubitState.copyWith(...)` or like so:`instanceOfLoginCubitState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginCubitStateCWProxy get copyWith => _$LoginCubitStateCWProxyImpl(this);
}
