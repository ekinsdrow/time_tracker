import 'package:flutter_test/flutter_test.dart';

import 'extensions/date_time_ext_test.dart';
import 'extensions/duration_ext_test.dart';
import 'extensions/int_ext_test.dart';
import 'extensions/string_ext_test.dart';

void unitTests() {
  group('Unit', () {
    group(
      'Extensions',
      () {
        dateTimeTest();

        durationExtTest();

        intExtTest();

        staringExtTest();
      },
    );
  });
}
