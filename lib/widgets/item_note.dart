import 'package:flutter/material.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tiêu đê: ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Text(
              overflow: TextOverflow.ellipsis, 'Nội dung: hôm nay làm gì?'),
          const Text(
            'Nội dung: ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Text(
                overflow: TextOverflow.ellipsis,
                'Đi chơi , đá bóng , xem phim '),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 35,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.edit),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 35,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
