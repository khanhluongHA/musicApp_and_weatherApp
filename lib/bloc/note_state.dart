part of 'note_bloc.dart';

class NoteState extends Equatable {
  const NoteState({this.notes = const []});
  final List<ItemNoteModel> notes;

  NoteState copyWith({List<ItemNoteModel>? notes}) {
    return NoteState(
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object> get props => [notes];
}
