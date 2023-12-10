part of 'note_cubit.dart';

enum NoteStatus { init, start, end, error }

class NoteCubitState extends Equatable {
  const NoteCubitState({
    this.notes = const [],
    this.status = NoteStatus.start,
  });

  final List<ItemNoteModel> notes;
  final Enum status;

  NoteCubitState copyWith({
    List<ItemNoteModel>? notes,
    Enum? status,
  }) {
    return NoteCubitState(
      notes: notes ?? this.notes,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        notes,
        status,
      ];
}
