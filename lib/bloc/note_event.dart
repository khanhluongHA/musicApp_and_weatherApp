part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class AddNote extends NoteEvent {
  final String newTitle;
  final String newContent;
  final String newTime;
  const AddNote({
    this.newTitle = '',
    this.newContent = '',
    this.newTime = '',
  });
  @override
  List<Object> get props => [newTitle, newContent, newTime];
}

class RemoveNote extends NoteEvent {
  final int removeIndex;

  const RemoveNote({
    this.removeIndex = 0,
  });
}
