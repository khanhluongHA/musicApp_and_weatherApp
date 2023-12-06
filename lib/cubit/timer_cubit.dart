import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

Timer? timer;
bool isFirst = true;

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerState());
  int newHour = 0;
  int newMinute = 0;
  int newSecond = 0;
  void setTime(
    int newHour,
    int newMinute,
  ) {
    newMinute--;
    emit(state.copyWith(hour: newHour, minute: newMinute, second: 60));
    newHour = state.hour * 3600;
    newMinute = state.minute * 60 + 60;
    newSecond = newHour + newMinute;
  }

  void startTimer() {
    emit(state.copyWith(isActive: true, status: TimerStatus.success));

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      emit(state.copyWith(status: TimerStatus.initial));

      if (newSecond == 0) {
        timer?.cancel();
      } else {
        if (isFirst == true) {
          isFirst = false;
          emit(state.copyWith(status: TimerStatus.initial));
          newSecond--;

          emit(state.copyWith(
              hour: newSecond ~/ 3600,
              minute: (newSecond ~/ 60) % 60,
              second: newSecond % 60,
              status: TimerStatus.success));
        } else {
          emit(state.copyWith(status: TimerStatus.initial));
          newSecond--;

          emit(state.copyWith(
              hour: newSecond ~/ 3600,
              minute: (newSecond ~/ 60) % 60,
              second: newSecond % 60,
              status: TimerStatus.success));
        }
      }
      emit(state.copyWith(status: TimerStatus.success));
    });
  }

  void stopTimer() {
    if (state.isRunning) {
      emit(state.copyWith(isRunning: false));
    } else {
      emit(state.copyWith(isRunning: true));
    }

    if (state.isRunning) {
      startTimer();
    } else {
      timer?.cancel();
    }
  }

  void resetTimer() {
    emit(state.copyWith(
      status: TimerStatus.initial,
      isActive: false,
    ));
    isFirst = true;
    timer?.cancel();

    emit(state.copyWith(
        hour: 0, minute: 0, isRunning: false, status: TimerStatus.success));
  }
}
