import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/bloc/note_bloc.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/config/save_data.dart';
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

  TextEditingController titleUpdateController = TextEditingController();
  TextEditingController contentUpdateController = TextEditingController();
  late NoteBloc noteBloc;

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
    super.initState();
    noteBloc = context.read<NoteBloc>();
    _getData();
    noteBloc.add(GetDataNote());
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
          backgroundColor: const Color(0xFF83A2FF),
        ),
        body: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state.notes.isEmpty
                        ? const Text(
                            'Ghi chú trống !',
                            style: TextStyle(fontSize: 25, color: Colors.grey),
                          )
                        : Expanded(
                            child: ListView.separated(
                                padding: const EdgeInsets.only(bottom: 65),
                                itemBuilder: (context, index) {
                                  return ItemNote(
                                    titleNote: state.notes[index].title,
                                    contentNote: state.notes[index].content,
                                    timeNote: state.notes[index].time,
                                    onTapDelete: () {
                                      noteBloc
                                          .add(RemoveNote(removeIndex: index));
                                    },
                                    onTapChanged: () {
                                      titleUpdateController.text =
                                          state.notes[index].title;
                                      contentUpdateController.text =
                                          state.notes[index].content;
                                      AlertDialogNote(
                                        context: context,
                                        title: 'Thay đổi ghi chú',
                                        onPressed: () {
                                          noteBloc.add(
                                            UpdateNote(
                                                indexUpdated: index,
                                                titleChanged:
                                                    titleUpdateController.text,
                                                contentChanged:
                                                    contentUpdateController
                                                        .text),
                                          );
                                          Navigator.pop(context);
                                        },
                                        content: '',
                                        titleController: titleUpdateController,
                                        contentController:
                                            contentUpdateController,
                                      );
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
              ),
            );
          },
        ),
      ),
    );
  }
}
