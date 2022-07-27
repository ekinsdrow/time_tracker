import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/common/extensions/date_time.dart';


void dateTimeTest() {
  test(
    'Test date time estension',
    () {
      final date = DateTime(2022, 2, 2);
      final formatedDate = date.formatDate;

      expect(formatedDate, '02.02.2022');
    },
  );
}
