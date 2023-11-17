import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/bloc/note_bloc.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/config/save_data.dart';
import 'package:test_bloc/models/item_note_model.dart';
import 'package:test_bloc/widgets/alert_dialog_note.dart';
import 'package:test_bloc/widgets/drawer_app.dart';
import 'package:test_bloc/widgets/item_note.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String userName = '';
  String password = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void _getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      userName = sharedPreferences.getString(SaveData.saveUserName) ?? '';
      password = sharedPreferences.getString(SaveData.savePassword) ?? '';
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final NoteBloc noteBloc = context.read<NoteBloc>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            AlertDialogNote(
              contentController: contentController,
              titleController: titleController,
              context: context,
              content: '',
              title: 'Thêm ghi chú',
              onPressed: () {
                setState(() {
                  listNote.add(
                    ItemNoteModel(
                      title: titleController.text,
                      content: contentController.text,
                      time: getTime(),
                    ),
                  );
                });
                noteBloc.add(AddNote(
                  newTitle: titleController.text,
                  newContent: contentController.text,
                ));
                titleController.text = '';
                contentController.text = '';
                Navigator.pop(context);
                printRed(titleController.text);
              },
            );
          },
        ),
        drawer: const DrawerApp(),
        appBar: AppBar(
          title: const Text('Danh sách ghi chú'),
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<NoteBloc, NoteState>(
          buildWhen: (previous, current) =>
              previous.notes.length != current.notes.length,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ItemNote(
                            titleNote: state.notes[index].title,
                            contentNote: state.notes[index].content,
                            timeNote: state.notes[index].time,
                            onTapDelete: () {
                              setState(() {
                                listNote.removeAt(index);
                              });
                              noteBloc.add(RemoveNote(removeIndex: index));
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: state.notes.length),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
