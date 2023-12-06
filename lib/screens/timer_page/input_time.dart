import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/cubit/timer_cubit.dart';
import 'package:test_bloc/screens/timer_page/timer_page.dart';

class InputTime extends StatefulWidget {
  InputTime({super.key});

  @override
  State<InputTime> createState() => _InputTimeState();
}

class _InputTimeState extends State<InputTime> {
  final TextEditingController hourController = TextEditingController();

  final TextEditingController minuteController = TextEditingController();

  @override
  void dispose() {
    hourController.dispose();
    minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TimerCubit timerCubit = context.read<TimerCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer app'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Giờ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: TextField(
                        controller: hourController,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      const Text(
                        'Phút',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          controller: minuteController,
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  timerCubit.setTime(
                    int.parse(hourController.text),
                    int.parse(minuteController.text),
                  );
                  hourController.text = '';
                  minuteController.text = '';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimerPage(),
                    ),
                  );
                },
                child: const Text('Bắt đầu'))
          ],
        ),
      ),
    );
  }
}
