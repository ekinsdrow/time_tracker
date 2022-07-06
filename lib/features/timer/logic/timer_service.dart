import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
import 'package:time_tracker/features/timer/models/timer_state.dart';

abstract class TimerService {
  Stream<Duration> get timer;
  Stream<CategoryLeaf?> get nowCategory;
  Stream<TimerState> get timerState;

  void start();
  void pause();
  void stop();
}
