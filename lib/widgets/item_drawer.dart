import 'package:flutter/material.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer(
      {super.key,
      required this.onPressed,
      this.textButton = '',
      this.icon = Icons.add});
  final VoidCallback onPressed;
  final String textButton;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {
          onPressed.call();
        },
        child: Row(
          children: [
            const SizedBox(width: 15),
            Icon(
              icon,
              color: Colors.blue,
            ),
            const SizedBox(width: 20),
            Text(
              textButton,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
