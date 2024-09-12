import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/cubit/note_realtime_cubit.dart';
import 'package:test_bloc/widgets/header_app.dart';

class NoteRealtimeScreen extends StatefulWidget {
  const NoteRealtimeScreen({super.key});

  @override
  State<NoteRealtimeScreen> createState() => _NoteRealtimeScreenState();
}

class _NoteRealtimeScreenState extends State<NoteRealtimeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  bool isLoading = false;
  final checkFormNoteRealtime = GlobalKey<FormState>();

  late NoteRealtimeCubit noteRealtimeCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noteRealtimeCubit = context.read<NoteRealtimeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                HeaderApp(
                    title: 'Note realtime',
                    callback: () {
                      Navigator.pop(context);
                    }),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: checkFormNoteRealtime,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(
                              child: TextFormField(
                                controller: titleController,
                                validator: _checkValidator,
                                decoration: const InputDecoration(
                                  labelText: 'Tiêu đề',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: contentController,
                                validator: _checkValidator,
                                decoration: const InputDecoration(
                                  labelText: 'Nội dung',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (checkFormNoteRealtime.currentState!
                                          .validate()) {
                                        FocusScope.of(context).unfocus();
                                        setState(() {
                                          isLoading = true;
                                        });
                                        noteRealtimeCubit
                                            .putNoteRealtimeDatabase(
                                                title: titleController.text,
                                                content: contentController.text)
                                            .then((value) => {
                                                  Timer(
                                                    const Duration(seconds: 1),
                                                    () {
                                                      setState(() {
                                                        isLoading = false;
                                                      });
                                                      titleController.clear();
                                                      contentController.clear();
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                });
                                      }
                                    },
                                    child: const Text('ADD')))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox()
        ],
      ),
    );
  }
}

String? _checkValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Hãy nhập nội dung ghi chú !';
  }
  return null;
}
