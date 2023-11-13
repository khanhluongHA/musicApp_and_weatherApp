import 'package:flutter/material.dart';

class CustomTextfieldLogin extends StatefulWidget {
  const CustomTextfieldLogin({
    super.key,
    required this.labelText,
    required this.controller,
  });
  final TextEditingController controller;

  final String labelText;

  @override
  State<CustomTextfieldLogin> createState() => _CustomTextfieldLoginState();
}

class _CustomTextfieldLoginState extends State<CustomTextfieldLogin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          isDense: true,
          labelText: widget.labelText,
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
