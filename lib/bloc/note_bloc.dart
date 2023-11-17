import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/models/item_note_model.dart';

part 'note_event.dart';
part 'note_state.dart';

List<ItemNoteModel> listNote = [];

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
  }

  void addNote(AddNote event, Emitter<NoteState> emit) {
    emit(
      state.copyWith(notes: listNote),
    );
  }

  void removeNote(RemoveNote event, Emitter<NoteState> emit) {
  
    emit(state.copyWith(notes: listNote));
  }
}
