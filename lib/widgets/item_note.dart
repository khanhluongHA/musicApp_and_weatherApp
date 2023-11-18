import 'dart:ffi';

import 'package:flutter/material.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({
    super.key,
    this.titleNote = '',
    this.contentNote = '',
    this.timeNote = '',
    required this.onTapDelete,
    required this.onTapChanged,
  });
  final String titleNote;
  final String contentNote;
  final String timeNote;
  final VoidCallback onTapDelete;
  final VoidCallback onTapChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
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
              const Text(
                'Tiêu đề: ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6499E9)),
              ),
              Text(
                timeNote,
                style: const TextStyle(fontSize: 14, color: Colors.green),
              ),
            ],
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            titleNote,
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(
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
              contentNote,
              style: TextStyle(fontSize: 13),
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
                  onTapChanged.call();
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
                  onTapDelete.call();
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
    );
  }
}
