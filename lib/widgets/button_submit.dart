import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit(
      {super.key, required this.onPressed, this.textButton = ''});
  final VoidCallback onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF83A2FF)),
      onPressed: () {
        onPressed.call();
      },
      child: Text(textButton),
    );
  }
}
