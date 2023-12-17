import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/config/app_color.dart';
import 'package:test_bloc/config/app_size.dart';
import 'package:test_bloc/cubit/note_cubit.dart';
import 'package:test_bloc/models/item_note_model.dart';

class DetailNote extends StatelessWidget {
   DetailNote({
    super.key,
    required this.note
  });
  final ItemNoteModel note;

  bool isAppear = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<NoteCubit, NoteCubitState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const SizedBox(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                            )),
                      ),
                      const Text(
                        'Chi tiết ghi chú',
                        style: TextStyle(fontSize: AppSize.size20),
                      ),
                      const SizedBox(
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ngày: ${note.time}',
                        style: const TextStyle(
                            fontSize: AppSize.size15, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Trạng thái: ',
                            style: TextStyle(
                                fontSize: AppSize.size15, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                           note.noteStatus
                                ? ' Đã làm'
                                : 'Chưa làm',
                            style: TextStyle(
                                color:note.noteStatus
                                    ? AppColors.green
                                    : Colors.red,
                                fontSize: AppSize.size15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Tiêu đề:',
                      style: TextStyle(
                          fontSize: AppSize.size18,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(note.title),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Nội dung:',
                      style: TextStyle(
                          fontSize: AppSize.size18,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(note.content),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: note.linkImage.isNotEmpty
                        ? Image(
                            image: NetworkImage(
                                note.linkImage),
                            height: 200,
                            width: 200,
                            fit: BoxFit.fill,
                          )
                        : const SizedBox(),
                  ),
                  const Expanded(child: SizedBox()),
                  Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Ok'))),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
