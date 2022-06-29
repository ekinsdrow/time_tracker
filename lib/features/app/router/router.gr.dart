// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const InitialPage());
    },
    LoginRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: MainPage(user: args.user, key: args.key));
    },
    SettingsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    AddCategoryRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const AddCategoryPage());
    },
    CategoryFilterRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const CategoryFilterPage());
    },
    TrackerRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const TrackerPage());
    },
    HistoryRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HistoryPage());
    },
    StatisticRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const StatisticPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(InitialRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(MainRoute.name, path: '/main-page', children: [
          RouteConfig(TrackerRouter.name,
              path: 'tracker', parent: MainRoute.name),
          RouteConfig(HistoryRouter.name,
              path: 'history', parent: MainRoute.name),
          RouteConfig(StatisticRouter.name,
              path: 'statistic', parent: MainRoute.name)
        ]),
        RouteConfig(SettingsRoute.name, path: '/settings-page'),
        RouteConfig(AddCategoryRoute.name, path: '/add-category-page'),
        RouteConfig(CategoryFilterRoute.name, path: '/category-filter-page')
      ];
}

/// generated route for
/// [InitialPage]
class InitialRoute extends PageRouteInfo<void> {
  const InitialRoute() : super(InitialRoute.name, path: '/');

  static const String name = 'InitialRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({required UserModel user, Key? key, List<PageRouteInfo>? children})
      : super(MainRoute.name,
            path: '/main-page',
            args: MainRouteArgs(user: user, key: key),
            initialChildren: children);

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({required this.user, this.key});

  final UserModel user;

  final Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [AddCategoryPage]
class AddCategoryRoute extends PageRouteInfo<void> {
  const AddCategoryRoute()
      : super(AddCategoryRoute.name, path: '/add-category-page');

  static const String name = 'AddCategoryRoute';
}

/// generated route for
/// [CategoryFilterPage]
class CategoryFilterRoute extends PageRouteInfo<void> {
  const CategoryFilterRoute()
      : super(CategoryFilterRoute.name, path: '/category-filter-page');

  static const String name = 'CategoryFilterRoute';
}

/// generated route for
/// [TrackerPage]
class TrackerRouter extends PageRouteInfo<void> {
  const TrackerRouter() : super(TrackerRouter.name, path: 'tracker');

  static const String name = 'TrackerRouter';
}

/// generated route for
/// [HistoryPage]
class HistoryRouter extends PageRouteInfo<void> {
  const HistoryRouter() : super(HistoryRouter.name, path: 'history');

  static const String name = 'HistoryRouter';
}

/// generated route for
/// [StatisticPage]
class StatisticRouter extends PageRouteInfo<void> {
  const StatisticRouter() : super(StatisticRouter.name, path: 'statistic');

  static const String name = 'StatisticRouter';
}
