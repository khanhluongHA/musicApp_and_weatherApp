import 'package:flutter/material.dart';

class CustomTextfieldLogin extends StatelessWidget {
  const CustomTextfieldLogin({
    super.key,
    required this.labelText,
    required this.controller,
    this.isHide = false,
  });
  final TextEditingController controller;
  final String labelText;
  final bool isHide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        validator: _checkValidator,
        obscureText: isHide,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, color: Colors.grey.withOpacity(0.6)), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: Colors.red), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

String? _checkValidator(String? value) {
  if (value == null || value.isEmpty || value.length < 5) {
    return 'Chưa thỏa mãn điều kiện username !';
  }
  return null;
}
