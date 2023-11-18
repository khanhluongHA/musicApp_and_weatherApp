import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/config/save_data.dart';
import 'package:test_bloc/models/item_note_model.dart';

part 'note_event.dart';
part 'note_state.dart';

List<ItemNoteModel> listNote = [];
List<String> listTitle = [];
List<String> listContent = [];
List<String> listTime = [];

getTime() {
  var time = DateTime.now();
  var dataTime = time.toString().split(' ');
  printCyan(dataTime[0]);
  return dataTime[0];
}

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(const NoteState()) {
    on<AddNote>(addNote);
    on<RemoveNote>(removeNote);
    on<GetDataNote>(getDataNote);
    on<UpdateNote>(updateNote);
  }

  Future<void> addNote(AddNote event, Emitter<NoteState> emit) async {
    emit(state.copyWith(status: StatusNoteState.start));

    listNote.add(
      ItemNoteModel(
        title: event.newTitle,
        content: event.newContent,
        time: getTime(),
      ),
    );

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

    emit(
      state.copyWith(
        notes: listNote,
        status: StatusNoteState.end,
      ),
    );
  }

  Future<void> removeNote(RemoveNote event, Emitter<NoteState> emit) async {
    emit(state.copyWith(status: StatusNoteState.start));
    printRed(listNote.length.toString());
    listNote.removeAt(event.removeIndex);
    printRed(listNote.length.toString());

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

  Future<void> getDataNote(GetDataNote event, Emitter<NoteState> emit) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    List<String> titles =
        sharedPreferences.getStringList(SaveData.saveTitle) ?? [];
    List<String> contents =
        sharedPreferences.getStringList(SaveData.saveContent) ?? [];
    List<String> times =
        sharedPreferences.getStringList(SaveData.saveTime) ?? [];
    for (int i = 0; i < times.length; i++) {
      listNote.add(ItemNoteModel(
          title: titles[i], content: contents[i], time: times[i]));
    }

    emit(state.copyWith(notes: listNote));
  }

  Future<void> updateNote(UpdateNote event, Emitter<NoteState> emit) async {
    emit(state.copyWith(status: StatusNoteState.start));
    for (int i = 0; i < listNote.length; i++) {
      if (i == event.indexUpdated) {
        listNote[i].title = event.titleChanged;
        listNote[i].content = event.contentChanged;
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
}
