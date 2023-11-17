part of 'note_bloc.dart';

enum StatusNoteState { start, end }

class NoteState extends Equatable {
  final List<ItemNoteModel> notes;
  final Enum status;
  const NoteState({this.notes = const [], this.status = StatusNoteState.start});

  NoteState copyWith({List<ItemNoteModel>? notes, Enum? status}) {
    return NoteState(
      notes: notes ?? this.notes,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [notes, status];
}
