import 'package:flutter/material.dart';

enum StatusDialog { success, error, warning }

// ignore: non_constant_identifier_names
Future<void> ShowAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onPressed,
  required Enum statusDialog,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: Text(title,
            style: TextStyle(color: getStatusDialog(statusDialog)),
            textAlign: TextAlign.center),
        content: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  textAlign: TextAlign.center,
                  content,
                  style: TextStyle(color: getStatusDialog(statusDialog)),
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
                child: Text(
                  'Ok',
                  style: TextStyle(color: getStatusDialog(statusDialog)),
                ),
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

Color getStatusDialog(Enum status) {
  if (status == StatusDialog.success) {
    return Colors.green;
  } else if (status == StatusDialog.error) {
    return Colors.red;
  } else {
    return Colors.orange;
  }
}
