import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
import 'package:time_tracker/features/timer/logic/timer_service.dart';
import 'package:time_tracker/features/timer/models/timer_state.dart';
import 'package:time_tracker/features/timer/models/timer_state_enum.dart';

class TimerSharedImpl implements TimerService {
  TimerSharedImpl._();

  static late final TimerSharedImpl instance;

  static late SharedPreferences _preferences;

  final _key = 'timer';

  static Future<void> init() async {
    instance = TimerSharedImpl._();
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Stream<TimerState> get state => _stateStream.stream;

  final _stateStream = BehaviorSubject<TimerState>.seeded(TimerState.empty());

  @override
  Future<void> pause() async {
    final state = _stateStream.value.copyWith(
      timerState: TimerS
    );

    _stateStream.add();
  }

  @override
  Future<void> start() async {
    _preferences.setString(
      _key,
      jsonEncode(
        TimerState(
          timerState: _timerStateStream.value,
          startTime: DateTime.now(),
          categoryLeaf: _nowCategoryStream.value,
        ).toJson(),
      ),
    );
    _timerStateStream.add(TimerStateEnum.play);
  }

  @override
  Future<void> stop() async {
    _timerStateStream.add(TimerStateEnum.stop);
  }
}
