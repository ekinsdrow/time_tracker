// import 'dart:async';
// import 'dart:developer';
// import 'dart:isolate';

// import 'package:flutter_foreground_task/flutter_foreground_task.dart';

// class TimerHandler extends TaskHandler {
//   Timer? _timer;

//   @override
//   Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
//     _timer?.cancel();
//   }

//   @override
//   Future<void> onEvent(DateTime timestamp, SendPort? sendPort) {
//     // TODO: implement onEvent
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
//     _timer = Timer.periodic(
//       const Duration(seconds: 1),
//       (timer) {
//         log(timer.tick.toString());
//         sendPort?.send(
//           Duration(
//             seconds: timer.tick,
//           ),
//         );
//       },
//     );
//   }
// }
