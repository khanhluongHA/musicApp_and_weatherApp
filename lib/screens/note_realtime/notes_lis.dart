import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/cubit/note_realtime_cubit.dart';
import 'package:test_bloc/cubit/note_realtime_state.dart';
import 'package:test_bloc/screens/note_page/ditail_note.dart';
import 'package:test_bloc/screens/note_realtime/note_realtime_screen.dart';
import 'package:test_bloc/widgets/alert_dialog_note_realtime.dart';
import 'package:test_bloc/widgets/header_app.dart';
import 'package:test_bloc/widgets/item_note.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  late NoteRealtimeCubit noteRealtimeCubit;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    noteRealtimeCubit = context.read<NoteRealtimeCubit>();
    noteRealtimeCubit.getNotes();
    printRed(noteRealtimeCubit.state.realtimeNotes.length.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    noteRealtimeCubit.getNotes();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NoteRealtimeScreen()));
          },
          child: const Icon(Icons.add)),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<NoteRealtimeCubit, NoteRealtimeState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return Column(
                children: [
                  HeaderApp(
                    title: 'List Notes',
                    callback: () {
                      Navigator.pop(context);
                    },
                  ),
                  noteRealtimeCubit.state.realtimeNotes.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                            const Text(
                              'Ghi chú trống !',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )
                      : Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(
                                bottom: 40, left: 20, right: 20),
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount:
                                noteRealtimeCubit.state.realtimeNotes.length,
                            itemBuilder: (context, index) {
                              return ItemNote(
                                note: noteRealtimeCubit
                                    .state.realtimeNotes[index],
                                onTapDelete: () {
                                  noteRealtimeCubit.removeNote(index);
                                },
                                onTapChanged: () {
                                  titleController.text = noteRealtimeCubit
                                      .state.realtimeNotes[index].title;
                                  contentController.text = noteRealtimeCubit
                                      .state.realtimeNotes[index].content;
                                  AlertDialogNoteRealTime(
                                    context: context,
                                    title: 'Thay đổi ghi chú',
                                    titleController: titleController,
                                    contentController: contentController,
                                    onPressed: () {
                                      noteRealtimeCubit.updateNote(
                                          index,
                                          titleController.text,
                                          contentController.text);
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                                callbackCheckBox: () {
                                  noteRealtimeCubit.changedStatusNote(
                                      index,
                                      noteRealtimeCubit.state
                                          .realtimeNotes[index].noteStatus);
                                },
                                onClick: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailNote(
                                        note: noteRealtimeCubit.state.realtimeNotes[index],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
