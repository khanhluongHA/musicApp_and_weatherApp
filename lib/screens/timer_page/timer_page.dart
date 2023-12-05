import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/cubit/timer_cubit.dart';
import 'package:test_bloc/screens/timer_page/input_time.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TimerCubit cubit = context.read<TimerCubit>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<TimerCubit, TimerState>(
            builder: (context, state) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(Icons.arrow_back))),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    state.second == 0 && state.hour == 0 && state.minute == 0
                        ? const Text(
                            'Done',
                            style: TextStyle(fontSize: 50, color: Colors.green),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${state.hour} :',
                                style: const TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red),
                              ),
                              Text(
                                '${state.minute} :',
                                style: const TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red),
                              ),
                              Text(
                                '${state.second}',
                                style: const TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    state.isActive
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              state.second == 0
                                  ? const SizedBox()
                                  : SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey),
                                        onPressed: () {
                                          cubit.stopTimer();
                                        },
                                        child: Text(
                                          state.isRunning
                                              ? 'Pause'
                                              : 'Continue',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                width: state.second == 0 ? 0 : 30,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => InputTime()));
                                    cubit.resetTimer();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              onPressed: () {
                                cubit.startTimer();
                              },
                              child: const Text(
                                'Start',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
