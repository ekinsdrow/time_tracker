extension StringExt on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get slice {
    if (length < 10) {
      return this;
    }

    return substring(0, 9) + ' ...';
  }
}
