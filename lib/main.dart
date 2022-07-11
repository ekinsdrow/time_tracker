import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/features/app/app.dart';
import 'package:time_tracker/features/timer/logic/timer_service_shared_impl.dart';
import 'package:time_tracker/firebase_options.dart';

//TODO: change name and icon
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await TimerSharedImpl.init();

  runApp(
    App(),
  );
}
