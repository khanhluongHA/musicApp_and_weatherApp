import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputPassword extends StatefulWidget {
  InputPassword(
      {super.key,
      required this.controller,
      this.isHidePassword = true,
      this.labelText = '',
      this.isError = false});

  late bool isHidePassword = true;
  final String labelText;
  final TextEditingController controller;

  bool isFocus = false;
  bool isError = false;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  var focusNode = FocusNode();
  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          widget.isFocus = true;
        });
      } else {
        setState(() {
          widget.isFocus = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        validator: _checkValidatorPassword,
        controller: widget.controller,
        focusNode: focusNode,
        obscureText: widget.isHidePassword,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: getSuffixIcon(
            isHidePassword: widget.isHidePassword,
            isError: widget.isError,
            colorError: Colors.red,
            colorIcon: Colors.blue,
            onTap: () {
              setState(() {
                widget.isHidePassword = !widget.isHidePassword;
              });
            },
          ),
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

Color textFieldIsErrorOrFocus(
    {required bool isError,
    required bool isFocus,
    required Color colorError,
    required Color colorFocus}) {
  if (isError) return colorError;
  return isFocus ? colorFocus : Colors.transparent;
}

Widget getSuffixIcon(
    {required bool isHidePassword,
    required bool isError,
    required Color colorError,
    required Color colorIcon,
    required VoidCallback onTap}) {
  if (isError) {
    return Icon(
      Icons.error,
      color: colorError,
    );
  }
  return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Icon(
        isHidePassword ? Icons.visibility_off : Icons.visibility,
        color: colorIcon,
      ));
}

String? _checkValidator(String? value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value!.isEmpty) {
    return 'Vui long hập mật khẩu !';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Chưa đáp ứng đủ điều kiện của mật khẩu !';
    } else {
      return null;
    }
  }
}

String? _checkValidatorPassword(String? value) {
  if (value == null || value.isEmpty || value.length < 5) {
    return 'Vui lòng nhập tiêu đề !';
  }
  return null;
}
