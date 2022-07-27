import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/common/extensions/string.dart';

void staringExtTest() {
  test(
    'String extension capitalize test',
    () {
      expect('test'.capitalize, 'Test');
      expect('Test'.capitalize, 'Test');
    },
  ); 
  
   test(
    'String extension slice test',
    () {
      expect('test'.slice, 'test');
      expect('Tttttttttttttttttttt'.slice, 'Ttttttttt ...');
    },
  );
}
