import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/themes/themes.dart';
import 'package:time_tracker/features/app/router/router.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.defaultRouteParser(),
      routerDelegate: _router.delegate(),
      title: 'Music App',
      theme: Themes.lightTheme,
    );
  }
}
