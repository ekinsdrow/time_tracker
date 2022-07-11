import 'package:time_tracker/features/timer/models/timer_state.dart';

abstract class TimerService {
  Stream<TimerState> get state;

  Future<void> start();
  Future<void> pause();
  Future<void> stop();
}
