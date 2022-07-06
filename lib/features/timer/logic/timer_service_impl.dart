import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
import 'package:time_tracker/features/timer/logic/timer_service.dart';
import 'package:time_tracker/features/timer/models/timer_state.dart';

// TODO: implement timer
class TimerServiceImpl implements TimerService {
  @override
  void start() {}

  @override
  void pause() {}

  @override
  void stop() {}

  @override
  Stream<CategoryLeaf?> get nowCategory => throw UnimplementedError();

  @override
  Stream<TimerState> get timerState => throw UnimplementedError();

  @override
  Stream<Duration> get timer => throw UnimplementedError();
}
