import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/config/save_data.dart';
import 'package:test_bloc/models/item_note_model.dart';

part 'note_state.dart';

List<ItemNoteModel> newNotes = [];

class NoteCubit extends Cubit<NoteCubitState> {
  NoteCubit() : super(const NoteCubitState());

  _getTime() {
    var time = DateTime.now();
    var dataTime = time.toString().split(' ');

    return dataTime[0];
  }

  void addNote(ItemNoteModel note) {
    emit(state.copyWith(status: NoteStatus.start));
    newNotes.add(note);
    emit(state.copyWith(status: NoteStatus.end, notes: newNotes));
    saveData();
  }

  void removeNote(int index) {
    print(state.notes.length);
    emit(state.copyWith(status: NoteStatus.start));
    newNotes.removeAt(index);
    emit(state.copyWith(status: NoteStatus.end, notes: newNotes));
    saveData();
  }

  void updateNote(ItemNoteModel note, int index) {
    emit(state.copyWith(status: NoteStatus.start));
    newNotes[index] = note;
    emit(state.copyWith(status: NoteStatus.end, notes: newNotes));
    saveData();
  }

  Future<void> saveData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var json = jsonEncode(state.notes);

    sharedPreferences.setString(SaveData.saveNotes, json);
    printRed('save data');
  }

  Future<void> getData() async {
    List items = [];

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var json = sharedPreferences.getString(SaveData.saveNotes);
    if (json == null) {
      return;
    }
    items = jsonDecode(json);

    final List<ItemNoteModel> data = ItemNoteModel.convertToList(items);
    newNotes = data;

    emit(state.copyWith(notes: newNotes));
  }

  Future<void> deleteDataWhenLogout() async {
    emit(state.copyWith(status: NoteStatus.start));

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.remove(SaveData.saveNotes);
    newNotes.clear();
    emit(state.copyWith(status: NoteStatus.end, notes: newNotes));
  }
}
