import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<void> ShowAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onPressed,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: Text(title,
            style: const TextStyle(color: Colors.green),
            textAlign: TextAlign.center),
        content: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 60,
                child: Text(
                  textAlign: TextAlign.center,
                  content,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  onPressed.call();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
// --- Button Widget --- //
