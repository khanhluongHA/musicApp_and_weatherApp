import 'package:flutter/material.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp(
      {super.key,
      this.title = '',
      this.color = Colors.black,
      required this.callback});

  final String title;
  final Color color;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              callback.call();
            },
            child: Icon(
              Icons.arrow_back,
              color: color,
              size: 30,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: color, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
