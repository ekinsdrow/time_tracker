import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/common/extensions/int.dart';

part 'time.freezed.dart';
part 'time.g.dart';

@freezed
class Time with _$Time {
  factory Time({
    required int hours,
    required int minutes,
    required int seconds,
  }) = _Time;

  factory Time.zero() => Time(hours: 0, minutes: 0, seconds: 0);

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
}

extension TimeToStr on Time {
  String get format => '${hours.addZero}:${minutes.addZero}:${seconds.addZero}';

  int get toDuration => hours * 3600 + minutes * 60 + seconds;
}
