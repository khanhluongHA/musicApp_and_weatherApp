import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_bloc/config/app_size.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/cubit/note_cubit.dart';
import 'package:test_bloc/models/item_note_model.dart';
import 'package:test_bloc/widgets/header_app.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final formKeyAddNote = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String url = '';
  bool isSelectImage = false;
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);

      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      printRed('failed to pick image : $e');
    }
    setState(() {
      isSelectImage = true;
    });
  }

  Future<String> uploadFile() async {
    final storageRef =
        FirebaseStorage.instance.ref().child("images").child(image?.path ?? "");
    final uploadTask = storageRef.putFile(image!);
    final snapshot = await uploadTask.whenComplete(() {});

    url = await snapshot.ref.getDownloadURL();

    printCyan(url);

    return url;
  }

  @override
  Widget build(BuildContext context) {
    final NoteCubit noteCubit = context.read<NoteCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderApp(
                  title: 'Thêm ghi chú',
                  callback: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Form(
                    key: formKeyAddNote,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                            controller: titleController,
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
                        TextFormField(
                          controller: contentController,
                          validator: _checkValidator,
                          maxLines: 4,
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          pickImage();
                        },
                        child: image != null
                            ? SizedBox()
                            : Container(
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width * 0.30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.add_a_photo,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                    Expanded(child: SizedBox()),
                                    Text(
                                      'Upload image',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              )),
                    image != null
                        ? Image.file(
                            image!,
                            width: AppSize.size100,
                            height: AppSize.size100,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ElevatedButton(
                        child: const Text(
                          'Hủy',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ElevatedButton(
                        child: const Text(
                          'Lưu',
                          style: TextStyle(color: Color(0xFF83A2FF)),
                        ),
                        onPressed: () async {
                          if (formKeyAddNote.currentState!.validate()) {
                            if (isSelectImage) {
                              var note = ItemNoteModel(
                                  title: titleController.text,
                                  content: contentController.text,
                                  time: _getTime(),
                                  noteStatus: false,
                                  linkImage: '');
                              uploadFile()
                                  .then((url) => note.linkImage = url)
                                  .then((value) => noteCubit.saveData());
                              noteCubit.addNote(note);
                              titleController.text = '';
                              contentController.text = '';
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            } else {
                              noteCubit.addNote(ItemNoteModel(
                                  title: titleController.text,
                                  content: contentController.text,
                                  time: _getTime(),
                                  noteStatus: false,
                                  linkImage: ''));
                              titleController.text = '';
                              contentController.text = '';
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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

_getTime() {
  var time = DateTime.now();
  var dataTime = time.toString().split(' ');

  return dataTime[0];
}
