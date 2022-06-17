import 'package:time_tracker/common/extensions/int.dart';

extension DtExt on DateTime {
  String get formatDate => '${day.addZero}.${month.addZero}.$year';
}
