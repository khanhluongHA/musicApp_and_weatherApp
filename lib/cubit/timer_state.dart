part of 'timer_cubit.dart';

enum TimerStatus { initial, success,end, error }

class TimerState extends Equatable {
  TimerState(
      {this.second = 60,
      this.hour = 0,
      this.minute = 0,
      this.status = TimerStatus.initial,
      this.isActive = false,
      this.isRunning = true});

  late TimerStatus status;
  late int second;
  late int hour;
  late int minute;
  final bool isRunning;
  final bool isActive;

  TimerState copyWith(
      {int? second,
      bool? isRunning,
      bool? isActive,
      TimerStatus? status,
      int? hour,
      int? minute}) {
    return TimerState(
        second: second ?? this.second,
        isRunning: isRunning ?? this.isRunning,
        isActive: isActive ?? this.isActive,
        status: status ?? this.status,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute);
  }

  @override
  List<Object> get props => [second, isActive, isRunning, status];
}
