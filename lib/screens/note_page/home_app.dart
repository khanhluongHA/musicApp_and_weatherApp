import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/cubit/login_cubit.dart';
import 'package:test_bloc/cubit/note_cubit.dart';
import 'package:test_bloc/models/item_note_model.dart';
import 'package:test_bloc/screens/note_page/add_note.dart';
import 'package:test_bloc/screens/note_page/ditail_note.dart';
import 'package:test_bloc/widgets/alert_dialog_note.dart';
import 'package:test_bloc/widgets/drawer_app.dart';
import 'package:test_bloc/widgets/item_note.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  TextEditingController titleUpdateController = TextEditingController();
  TextEditingController contentUpdateController = TextEditingController();

  late NoteCubit noteCubit;
  late LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    noteCubit = context.read<NoteCubit>();
    loginCubit = context.read<LoginCubit>();

    noteCubit.getData();
    loginCubit.getUserLocal();
  }

  @override
  Widget build(BuildContext context) {
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNoteScreen()));
          },
        ),
        drawer: const DrawerApp(),
        appBar: AppBar(
          title: const Text('Danh sách ghi chú'),
          backgroundColor: const Color(0xFF83A2FF),
        ),
        body: BlocBuilder<NoteCubit, NoteCubitState>(
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
                    noteCubit.state.notes.isEmpty
                        ? const Text(
                            'Ghi chú trống !',
                            style: TextStyle(fontSize: 25, color: Colors.grey),
                          )
                        : Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.only(bottom: 65),
                              itemCount: noteCubit.state.notes.length,
                              itemBuilder: (context, index) {
                                return ItemNote(
                                  note: noteCubit.state.notes[index],
                                  callbackCheckBox: () {
                                    noteCubit.updateNote(
                                        ItemNoteModel(
                                            title: noteCubit
                                                .state.notes[index].title,
                                            content: noteCubit
                                                .state.notes[index].content,
                                            time: noteCubit
                                                .state.notes[index].time,
                                            noteStatus: !noteCubit
                                                .state.notes[index].noteStatus,
                                            linkImage: noteCubit
                                                .state.notes[index].linkImage),
                                        index);
                                  },
                                  onClick: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailNote(
                                          index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  onTapDelete: () {
                                    noteCubit.removeNote(
                                      index,
                                    );
                                  },
                                  onTapChanged: () {
                                    titleUpdateController.text =
                                        noteCubit.state.notes[index].title;
                                    contentUpdateController.text =
                                        noteCubit.state.notes[index].content;
                                    AlertDialogNote(
                                      context: context,
                                      title: 'Thay đổi ghi chú',
                                      onPressed: () {
                                        noteCubit.updateNote(
                                            ItemNoteModel(
                                                title:
                                                    titleUpdateController.text,
                                                content: contentUpdateController
                                                    .text,
                                                time: noteCubit
                                                    .state.notes[index].time,
                                                noteStatus: noteCubit.state
                                                    .notes[index].noteStatus,
                                                linkImage: noteCubit.state
                                                    .notes[index].linkImage),
                                            index);

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
                            ),
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

_getTime() {
  var time = DateTime.now();
  var dataTime = time.toString().split(' ');

  return dataTime[0];
}
