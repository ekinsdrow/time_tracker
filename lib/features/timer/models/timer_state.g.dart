// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerState _$$_TimerStateFromJson(Map<String, dynamic> json) =>
    _$_TimerState(
      timerState: $enumDecode(_$TimerStateEnumEnumMap, json['timerState']),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      categoryLeaf: json['categoryLeaf'] == null
          ? null
          : CategoryLeaf.fromJson(json['categoryLeaf'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TimerStateToJson(_$_TimerState instance) =>
    <String, dynamic>{
      'timerState': _$TimerStateEnumEnumMap[instance.timerState],
      'startTime': instance.startTime?.toIso8601String(),
      'categoryLeaf': instance.categoryLeaf,
    };

const _$TimerStateEnumEnumMap = {
  TimerStateEnum.play: 'play',
  TimerStateEnum.pause: 'pause',
  TimerStateEnum.stop: 'stop',
};
