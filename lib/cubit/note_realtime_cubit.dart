import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_bloc/cubit/note_realtime_state.dart';
import 'package:test_bloc/models/item_note_model.dart';

class NoteRealtimeCubit extends Cubit<NoteRealtimeState> {
  NoteRealtimeCubit() : super(const NoteRealtimeState());

  final database = FirebaseDatabase.instance.ref().child('Notes');

  Future<void> putNoteRealtimeDatabase(
      {required String title, required String content}) async {
    database.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
      'id': DateTime.now().microsecondsSinceEpoch,
      'title': title,
      'content': content,
      'time': _getTime(),
      'noteStatus': false,
      'linkImage': '',
    });
  }

  void getNotes() async {
    emit(state.copyWith(status: NoteRealtimeStatus.start));
    List<String> keyNotes = [];
    List<ItemNoteModel> newNotes = [];

    final snapshot = await database.get();
    final data = jsonDecode(jsonEncode(snapshot.value));

    if (data == null) {
      return;
    }
    Map<String, dynamic> newData = data as Map<String, dynamic>;

    newData.forEach(
      (key, value) {
        keyNotes.add(key);
        ItemNoteModel item;
        item = ItemNoteModel.fromJson(value);
        newNotes.add(item);
      },
    );

    emit(
      state.copyWith(
          status: NoteRealtimeStatus.success,
          keyNotes: keyNotes,
          realtimeNotes: newNotes),
    );
  }

  void removeNote(int index) {
    emit(state.copyWith(status: NoteRealtimeStatus.start));

    database.child(state.keyNotes[index]).remove();
    List<ItemNoteModel> notes = state.realtimeNotes;
    List<String> keys = state.keyNotes;
    notes.removeAt(index);
    keys.removeAt(index);

    emit(state.copyWith(
        keyNotes: keys,
        realtimeNotes: notes,
        status: NoteRealtimeStatus.success));
  }

  Future<void> updateNote(
    int index,
    String title,
    String content,
  ) async {
    List<ItemNoteModel> newNotes = state.realtimeNotes;

    emit(state.copyWith(status: NoteRealtimeStatus.start));
    await database.child(state.keyNotes[index]).update({
      'title': title,
      'content': content,
    });

    getNotes();
  }

  Future<void> changedStatusNote(int index, bool status) async {
    bool value = !status;
    await database.child(state.keyNotes[index]).update({'noteStatus': value});
    getNotes();
  }

  String _getTime() {
    var time = DateTime.now();
    var day = DateFormat('d/M/yyyy').format(time);
    return day;
  }
}
