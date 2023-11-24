import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/models/item_note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteCubitState> {
  NoteCubit() : super(const NoteCubitState());
}
