import 'package:flutter/material.dart';

class ItemNote extends StatefulWidget {
  ItemNote(
      {super.key,
      this.titleNote = '',
      this.contentNote = '',
      this.timeNote = '',
      required this.onTapDelete,
      required this.onTapChanged,
      required this.onClick,
      required this.callbackCheckBox,
      this.isStatus = false});
  final String titleNote;
  final String contentNote;
  final String timeNote;
  final VoidCallback onTapDelete;
  final VoidCallback onTapChanged;
  final VoidCallback onClick;
  final VoidCallback callbackCheckBox;
  late bool? isStatus;

  @override
  State<ItemNote> createState() => _ItemNoteState();
}

class _ItemNoteState extends State<ItemNote> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick.call();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.timeNote,
                  style: const TextStyle(fontSize: 14, color: Colors.green),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Trạng thái: '),
                    Checkbox(
                      isError: true,
                      value: widget.isStatus,
                      focusColor: Colors.red,
                      activeColor: Colors.green,
                      onChanged: (bool? value) {
                       widget.callbackCheckBox.call();
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              'Tiêu đề: ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6499E9)),
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              widget.titleNote,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Nội dung: ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6499E9)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                overflow: TextOverflow.ellipsis,
                widget.contentNote,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    widget.onTapChanged.call();
                  },
                  child: Container(
                    height: 35,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.edit),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    widget.onTapDelete.call();
                  },
                  child: Container(
                    height: 35,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
