import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/bloc/note_bloc.dart';
import 'package:test_bloc/config/save_data.dart';
import 'package:test_bloc/models/item_note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteCubitState> {
  NoteCubit() : super(const NoteCubitState());

  _getTime() {
    var time = DateTime.now();
    var dataTime = time.toString().split(' ');

    return dataTime[0];
  }

  Future<void> addNote({required String title, required String content}) async {
    emit(state.copyWith(status: StatusNoteState.start));
    listTitle.clear();
    listContent.clear();
    listTime.clear();
    listStatus.clear();

    listNote.add(
      ItemNoteModel(
          title: title, content: content, time: _getTime(), noteStatus: false),
    );

    for (int i = 0; i < listNote.length; i++) {
      listTitle.add(listNote[i].title);
      listContent.add(listNote[i].content);
      listTime.add(listNote[i].time);
      listStatus.add(listNote[i].noteStatus);
    }
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setStringList(SaveData.saveTitle, listTitle);
    sharedPreferences.setStringList(SaveData.saveContent, listContent);
    sharedPreferences.setStringList(SaveData.saveTime, listTime);
    final List<String> listStringStatus = [];
    for (int i = 0; i < listStatus.length; i++) {
      String item = listStatus[i].toString();
      listStringStatus.add(item);
      print(item);
    }
    sharedPreferences.setStringList(SaveData.saveStatus, listStringStatus);

    emit(
      state.copyWith(
        notes: listNote,
        status: StatusNoteState.end,
      ),
    );
  }

  Future<void> removeNote({required int indexRemove}) async {
    listTitle.clear();
    listContent.clear();
    listTime.clear();
    listStatus.clear();

    emit(state.copyWith(status: StatusNoteState.start));
    listNote.removeAt(indexRemove);

    for (int i = 0; i < listNote.length; i++) {
      listTitle.add(listNote[i].title);
      listContent.add(listNote[i].content);
      listTime.add(listNote[i].time);
    }
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setStringList(SaveData.saveTitle, listTitle);
    sharedPreferences.setStringList(SaveData.saveContent, listContent);
    sharedPreferences.setStringList(SaveData.saveTime, listTime);
    emit(state.copyWith(notes: listNote, status: StatusNoteState.end));
  }

  Future<void> getDataNote() async {
    listNote.clear();
    listTitle.clear();
    listContent.clear();
    listTime.clear();
    listStatus.clear();

    emit(state.copyWith(notes: listNote));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    listTitle = sharedPreferences.getStringList(SaveData.saveTitle) ?? [];
    listContent = sharedPreferences.getStringList(SaveData.saveContent) ?? [];

    listTime = sharedPreferences.getStringList(SaveData.saveTime) ?? [];
    final List<String> listStringStatus =
        sharedPreferences.getStringList(SaveData.saveStatus) ?? [];
    for (int i = 0; i < listStringStatus.length; i++) {
      bool item = bool.parse(listStringStatus[i]);
      listStatus.add(item);
    }

    for (int i = 0; i < listTitle.length; i++) {
      listNote.add(ItemNoteModel(
          title: listTitle[i],
          content: listContent[i],
          time: listTime[i],
          noteStatus: listStatus[i]));
    }

    emit(state.copyWith(notes: listNote));
  }

  Future<void> updateNote(
      {required int indexUpdated,
      required String titleChanged,
      required String contentChanged}) async {
    listTitle.clear();
    listContent.clear();
    listTime.clear();
    listStatus.clear();

    emit(state.copyWith(status: StatusNoteState.start));
    for (int i = 0; i < listNote.length; i++) {
      if (i == indexUpdated) {
        listNote[i].title = titleChanged;
        listNote[i].content = contentChanged;
      }
    }

    for (int i = 0; i < listNote.length; i++) {
      listTitle.add(listNote[i].title);
      listContent.add(listNote[i].content);
      listTime.add(listNote[i].time);
    }
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setStringList(SaveData.saveTitle, listTitle);
    sharedPreferences.setStringList(SaveData.saveContent, listContent);
    sharedPreferences.setStringList(SaveData.saveTime, listTime);
    emit(state.copyWith(notes: listNote, status: StatusNoteState.end));
  }

  Future<void> setValueCheckBox(
    int index,
  ) async {
    emit(state.copyWith(status: StatusNoteState.start));
    listTitle.clear();
    listContent.clear();
    listTime.clear();
    listStatus.clear();

    for (int i = 0; i < listNote.length; i++) {
      listTitle.add(listNote[i].title);
      listContent.add(listNote[i].content);
      listTime.add(listNote[i].time);
      listStatus.add(listNote[i].noteStatus);
    }

    bool value = !listStatus[index];
    listStatus[index] = value;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final List<String> listStringStatus = [];
    for (int i = 0; i < listStatus.length; i++) {
      String item = listStatus[i].toString();
      listStringStatus.add(item);
      print(item);
    }
    sharedPreferences.setStringList(SaveData.saveStatus, listStringStatus);
    listTitle = sharedPreferences.getStringList(SaveData.saveTitle) ?? [];
    listContent = sharedPreferences.getStringList(SaveData.saveContent) ?? [];
    listTime = sharedPreferences.getStringList(SaveData.saveTime) ?? [];
    listNote.clear();
    for (int i = 0; i < listTitle.length; i++) {
      listNote.add(ItemNoteModel(
          title: listTitle[i],
          content: listContent[i],
          time: listTime[i],
          noteStatus: listStatus[i]));
    }
    emit(state.copyWith(status: StatusNoteState.end, notes: listNote));
  }
}
