import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/features/add_activity/widgets/add_activity_page.dart';
import 'package:time_tracker/features/add_category/widgets/add_category_page.dart';
import 'package:time_tracker/features/category_filter/widgets/category_filter_page.dart';
import 'package:time_tracker/features/init/widgets/initial_page.dart';
import 'package:time_tracker/features/login/widgets/login_page.dart';
import 'package:time_tracker/features/main/features/history/widgets/history_page.dart';
import 'package:time_tracker/features/main/features/statistic/widgets/statistic_page.dart';
import 'package:time_tracker/features/main/features/tracker/widgets/tracker_page.dart';
import 'package:time_tracker/features/main/widgets/main_page.dart';
import 'package:time_tracker/features/settings/widgets/settings_page.dart';
import 'package:time_tracker/features/user/data/models/user.dart';

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
      children: [
        AutoRoute<dynamic>(
          path: 'tracker',
          name: 'TrackerRouter',
          page: TrackerPage,
        ),
        AutoRoute<dynamic>(
          path: 'history',
          name: 'HistoryRouter',
          page: HistoryPage,
        ),
        AutoRoute<dynamic>(
          path: 'statistic',
          name: 'StatisticRouter',
          page: StatisticPage,
        ),
      ],
    ),
    AutoRoute(
      name: 'SettingsRoute',
      page: SettingsPage,
    ),
    AutoRoute(
      name: 'AddCategoryRoute',
      page: AddCategoryPage,
    ),
    AutoRoute(
      name: 'CategoryFilterRoute',
      page: CategoryFilterPage,
    ),  AutoRoute(
      name: 'AddActivityRoute',
      page: AddActivityPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
