import 'package:flutter_test/flutter_test.dart';

import 'date_time_ext_test.dart';
import 'duration_ext_test.dart';
import 'int_ext_test.dart';

void extensionsTests() {
  group(
    'Extensions tests',
    () {
      dateTimeTest();

      durationExtTest();

      intExtTest();
    },
  );
}
