
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/models/item_note_model.dart';
part 'note_realtime_state.g.dart';
enum NoteRealtimeStatus { init, start, success, error }

@CopyWith()
class NoteRealtimeState extends Equatable {
  const NoteRealtimeState(
      {this.realtimeNotes = const [], this.status = NoteRealtimeStatus.init, this.keyNotes = const []});
  final List<ItemNoteModel> realtimeNotes;
  final Enum status;
  final List<String> keyNotes;

  @override
  List<Object> get props => [realtimeNotes,status, keyNotes];
}
