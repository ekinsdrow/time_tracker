extension Zero on int {
  String get addZero => '${this < 10 ? '0$this' : this}';
  String get toTime {
    final duration = Duration(seconds: this);
    final h = duration.inSeconds ~/ 3600;
    final m = (duration.inSeconds - h * 3600) ~/ 60;
    final s = duration.inSeconds - h * 3600 - m * 60;
    return '${h.addZero}:${m.addZero}:${s.addZero}';
  }
}
