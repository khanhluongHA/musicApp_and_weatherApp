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
List<bool> listStatus = [];

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(const NoteState()) {
    on<AddNote>(addNote);
    on<RemoveNote>(removeNote);
    on<GetDataNote>(getDataNote);
    on<UpdateNote>(updateNote);
  }

  _getTime() {
    var time = DateTime.now();
    var dataTime = time.toString().split(' ');
    printCyan(dataTime[0]);
    return dataTime[0];
  }

  Future<void> addNote(AddNote event, Emitter<NoteState> emit) async {
    emit(state.copyWith(status: StatusNoteState.start));

    // listNote.add(
    //   ItemNoteModel(
    //       title: event.newTitle,
    //       content: event.newContent,
    //       time: _getTime(),
    //       noteStatus: false),

    // );

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
    listNote.clear();
    emit(state.copyWith(notes: listNote));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    listTitle = sharedPreferences.getStringList(SaveData.saveTitle) ?? [];
    listContent = sharedPreferences.getStringList(SaveData.saveContent) ?? [];
    listTime = sharedPreferences.getStringList(SaveData.saveTime) ?? [];
    listTime = sharedPreferences.getStringList(SaveData.saveTime) ?? [];
    final List<String> listStringStatus =
        sharedPreferences.getStringList(SaveData.saveStatus) ?? [];
    for (int i = 0; i < listStringStatus.length; i++) {
      bool item = bool.parse(listStringStatus[i]);
      listStatus.add(item);
    }

    for (int i = 0; i < listTitle.length; i++) {
      // listNote.add(ItemNoteModel(
      //     title: listTitle[i],
      //     content: listContent[i],
      //     time: listTime[i],
      //     noteStatus: listStatus[i]));
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
