// import 'dart:developer';
// import 'dart:isolate';

// import 'package:flutter_foreground_task/flutter_foreground_task.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
// import 'package:time_tracker/features/timer/logic/timer_handler.dart';
// import 'package:time_tracker/features/timer/logic/timer_service.dart';
// import 'package:time_tracker/features/timer/models/timer_state.dart';

// void startCallback() {
//   FlutterForegroundTask.setTaskHandler(
//     TimerHandler(),
//   );
// }

// class TimerServiceImpl implements TimerService {
//   TimerServiceImpl._() {
//     _init();
//   }

//   static final TimerServiceImpl instance = TimerServiceImpl._();

//   final _nowCategoryStream = BehaviorSubject<CategoryLeaf?>.seeded(null);
//   @override
//   Stream<CategoryLeaf?> get nowCategory => _nowCategoryStream.stream;

//   final _timerStateStream = BehaviorSubject<TimerState>.seeded(TimerState.stop);
//   @override
//   Stream<TimerState> get timerState => _timerStateStream.stream;

//   final _timeStream = BehaviorSubject<Duration>.seeded(Duration.zero);
//   @override
//   Stream<Duration> get timer => _timeStream.stream;

//   ReceivePort? _port;

//   Future<void> _init() async {
//     FlutterForegroundTask.receivePort.then(
//       (value) {
//         _setPort(value);
//       },
//     );
//   }

//   void _setPort(ReceivePort? port) {
//     _port = port;
//     log(port.toString());

//     _port?.listen(
//       (message) {
//         if (message is Duration) {
//           _timeStream.add(message);
//         }
//       },
//     );
//   }

//   @override
//   Future<void> start() async {
//     _timerStateStream.add(TimerState.play);

//     final port = await FlutterForegroundTask.startService(
//       notificationText: 'Time Tracker',
//       notificationTitle: 'Time Tracker',
//       callback: startCallback,
//     );

//     _setPort(port);
//   }

//   @override
//   Future<void> pause() async {
//     _timerStateStream.add(TimerState.pause);
//   }

//   @override
//   Future<void> stop() async {
//     _timerStateStream.add(TimerState.stop);
//     _timeStream.add(Duration.zero);

//     FlutterForegroundTask.stopService();
//   }
// }
