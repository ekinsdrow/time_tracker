import 'package:time_tracker/common/extensions/int.dart';

extension DurationExt on Duration {
  String get format {
    final h = inHours;
    final m = inMinutes - inHours * 60;
    final s = inSeconds - m * 60 - h * 3600;

    return '${h.addZero}:${m.addZero}:${s.addZero}';
  }
}
