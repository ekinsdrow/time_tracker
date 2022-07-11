import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
import 'package:time_tracker/features/timer/models/timer_state_enum.dart';

part 'timer_state.freezed.dart';
part 'timer_state.g.dart';

@freezed
class TimerState with _$TimerState {
  factory TimerState({
    required TimerStateEnum timerState,
    required List<DateTimeRange> startTime,
    required CategoryLeaf? categoryLeaf,
  }) = _TimerState;

  factory TimerState.fromJson(Map<String, dynamic> json) =>
      _$TimerStateFromJson(json);

  factory TimerState.empty() => TimerState(
        timerState: TimerStateEnum.stop,
        startTime: null,
        categoryLeaf: null,
      );
}
