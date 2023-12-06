import 'package:flutter/material.dart';
import 'package:test_bloc/config/app_color.dart';
import 'package:test_bloc/config/app_size.dart';

class DetailNote extends StatelessWidget {
  const DetailNote(
      {super.key,
      this.date = '',
      this.title = '',
      this.content = '',
      this.isStatus = false});
  final String date;
  final String title;
  final String content;
  final bool isStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        )),
                  ),
                  Text(
                    'Chi tiết ghi chú',
                    style: TextStyle(fontSize: AppSize.size20),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Ngày: $date',
                style: const TextStyle(
                    fontSize: AppSize.size20, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Trạng thái: ',
                    style: TextStyle(
                        fontSize: AppSize.size18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    isStatus ? ' Đã làm' : 'Chưa làm',
                    style: TextStyle(
                        color: isStatus ? AppColors.green : Colors.red,
                        fontSize: AppSize.size18),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Tiêu đề:',
                  style: TextStyle(
                      fontSize: AppSize.size18, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 5,
              ),
              Text('$title'),
              const SizedBox(
                height: 20,
              ),
              const Text('Nội dung:',
                  style: TextStyle(
                      fontSize: AppSize.size18, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 5,
              ),
              Text('$content')
            ],
          ),
        ),
      ),
    );
  }
}
