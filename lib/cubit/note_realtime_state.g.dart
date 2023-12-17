// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_realtime_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NoteRealtimeStateCWProxy {
  NoteRealtimeState keyNotes(List<String> keyNotes);

  NoteRealtimeState realtimeNotes(List<ItemNoteModel> realtimeNotes);

  NoteRealtimeState status(Enum status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NoteRealtimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NoteRealtimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  NoteRealtimeState call({
    List<String>? keyNotes,
    List<ItemNoteModel>? realtimeNotes,
    Enum? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNoteRealtimeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNoteRealtimeState.copyWith.fieldName(...)`
class _$NoteRealtimeStateCWProxyImpl implements _$NoteRealtimeStateCWProxy {
  final NoteRealtimeState _value;

  const _$NoteRealtimeStateCWProxyImpl(this._value);

  @override
  NoteRealtimeState keyNotes(List<String> keyNotes) => this(keyNotes: keyNotes);

  @override
  NoteRealtimeState realtimeNotes(List<ItemNoteModel> realtimeNotes) =>
      this(realtimeNotes: realtimeNotes);

  @override
  NoteRealtimeState status(Enum status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NoteRealtimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NoteRealtimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  NoteRealtimeState call({
    Object? keyNotes = const $CopyWithPlaceholder(),
    Object? realtimeNotes = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return NoteRealtimeState(
      keyNotes: keyNotes == const $CopyWithPlaceholder() || keyNotes == null
          ? _value.keyNotes
          // ignore: cast_nullable_to_non_nullable
          : keyNotes as List<String>,
      realtimeNotes:
          realtimeNotes == const $CopyWithPlaceholder() || realtimeNotes == null
              ? _value.realtimeNotes
              // ignore: cast_nullable_to_non_nullable
              : realtimeNotes as List<ItemNoteModel>,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as Enum,
    );
  }
}

extension $NoteRealtimeStateCopyWith on NoteRealtimeState {
  /// Returns a callable class that can be used as follows: `instanceOfNoteRealtimeState.copyWith(...)` or like so:`instanceOfNoteRealtimeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NoteRealtimeStateCWProxy get copyWith =>
      _$NoteRealtimeStateCWProxyImpl(this);
}
