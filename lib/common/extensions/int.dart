extension Zero on int {
  String get addZero => '${this < 10 ? '0$this' : this}';
}
