import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/common/extensions/duration_ext.dart';

void durationExtTest() {
  test(
    'Duration extension test',
    () {
      final dur = const Duration(
        minutes: 10,
        hours: 2,
        seconds: 20,
      ).format;

      expect(dur, '02:10:20');
    },
  );
}
