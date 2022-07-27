import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/common/extensions/int.dart';

void intExtTest() {
  test('Int extension add zero test', () {
    expect(9.addZero, '09');
    expect(11.addZero, '11');
  });

  test('Int extension toTime test', () {
    expect(3601.toTime, '01:00:01');
  });
}
