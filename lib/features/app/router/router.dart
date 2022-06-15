import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/features/init/widgets/initial_page.dart';
import 'package:time_tracker/features/login/widgets/login_page.dart';
import 'package:time_tracker/features/main/widgets/main_page.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      name: 'InitialRoute',
      page: InitialPage,
    ),
    AutoRoute(
      name: 'LoginRoute',
      page: LoginPage,
    ),
    AutoRoute(
      name: 'MainRoute',
      page: MainPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
