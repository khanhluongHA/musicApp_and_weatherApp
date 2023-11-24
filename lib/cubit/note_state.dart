part of 'note_cubit.dart';

enum StatusNoteState { start, end }

class NoteCubitState extends Equatable {
  const NoteCubitState({
    this.notes = const [],
    this.status = StatusNoteState.start,
  });
  final List<ItemNoteModel> notes;
  final Enum status;
  NoteCubitState copyWith({List<ItemNoteModel>? notes, Enum? status}) {
    return NoteCubitState(
      notes: notes ?? this.notes,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [notes, status];
}
