import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/config/app_color.dart';
import 'package:test_bloc/config/app_size.dart';
import 'package:test_bloc/cubit/note_cubit.dart';

class DetailNote extends StatefulWidget {
  const DetailNote({
    super.key,
    this.index = 0,
  });
  final int index;

  @override
  State<DetailNote> createState() => _DetailNoteState();
}

class _DetailNoteState extends State<DetailNote> {
  late NoteCubit cubit;
  bool isAppear = false;

  @override
  void initState() {
    cubit = context.read<NoteCubit>();

    super.initState();
  }

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
                        'Ngày: ${state.notes[widget.index].time}',
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
                            state.notes[widget.index].noteStatus
                                ? ' Đã làm'
                                : 'Chưa làm',
                            style: TextStyle(
                                color: state.notes[widget.index].noteStatus
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
                  Text(state.notes[widget.index].title),
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
                  Text(state.notes[widget.index].content),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: state.notes[widget.index].linkImage.isNotEmpty
                        ? Image(
                            image: NetworkImage(
                                state.notes[widget.index].linkImage),
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          )
                        : const SizedBox(),
                  ),
                  Expanded(child: SizedBox()),
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
