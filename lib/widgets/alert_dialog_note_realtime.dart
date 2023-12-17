import 'package:flutter/material.dart';

final formKeyDialogNote = GlobalKey<FormState>();
// ignore: non_constant_identifier_names
Future<void> AlertDialogNoteRealTime({
  required BuildContext context,
  required String title,
  required VoidCallback onPressed,
  required TextEditingController titleController,
  required TextEditingController contentController,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: Text(title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Form(
            key: formKeyDialogNote,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        controller: contentController,
                        validator: _checkValidator,
                        maxLines: 3,
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
                  ],
                ),
              ),
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: const Text(
                  'Hủy',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text(
                  'Lưu',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  if (formKeyDialogNote.currentState!.validate()) {
                    onPressed.call();
                  }
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}

String? _checkValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Hãy nhập nội dung ghi chú !';
  }
  return null;
}

String? _checkValidatorTitle(String? value) {
  if (value == null || value.isEmpty) {
    return 'Vui lòng nhập tiêu đề !';
  }
  return null;
}
