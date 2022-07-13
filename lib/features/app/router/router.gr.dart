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
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const MainPage());
    },
    SettingsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    AddCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<AddCategoryRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: AddCategoryPage(
              user: args.user, startRootId: args.startRootId, key: args.key));
    },
    CategoryFilterRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const CategoryFilterPage());
    },
    AddActivityRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const AddActivityPage());
    },
    ImportRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ImportPage());
    },
    TrackerRouter.name: (routeData) {
      final args = routeData.argsAs<TrackerRouterArgs>(
          orElse: () => const TrackerRouterArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData, child: TrackerPage(key: args.key));
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
        RouteConfig(CategoryFilterRoute.name, path: '/category-filter-page'),
        RouteConfig(AddActivityRoute.name, path: '/add-activity-page'),
        RouteConfig(ImportRoute.name, path: '/import-page')
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
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main-page', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [AddCategoryPage]
class AddCategoryRoute extends PageRouteInfo<AddCategoryRouteArgs> {
  AddCategoryRoute(
      {required UserModel user, required String startRootId, Key? key})
      : super(AddCategoryRoute.name,
            path: '/add-category-page',
            args: AddCategoryRouteArgs(
                user: user, startRootId: startRootId, key: key));

  static const String name = 'AddCategoryRoute';
}

class AddCategoryRouteArgs {
  const AddCategoryRouteArgs(
      {required this.user, required this.startRootId, this.key});

  final UserModel user;

  final String startRootId;

  final Key? key;

  @override
  String toString() {
    return 'AddCategoryRouteArgs{user: $user, startRootId: $startRootId, key: $key}';
  }
}

/// generated route for
/// [CategoryFilterPage]
class CategoryFilterRoute extends PageRouteInfo<void> {
  const CategoryFilterRoute()
      : super(CategoryFilterRoute.name, path: '/category-filter-page');

  static const String name = 'CategoryFilterRoute';
}

/// generated route for
/// [AddActivityPage]
class AddActivityRoute extends PageRouteInfo<void> {
  const AddActivityRoute()
      : super(AddActivityRoute.name, path: '/add-activity-page');

  static const String name = 'AddActivityRoute';
}

/// generated route for
/// [ImportPage]
class ImportRoute extends PageRouteInfo<void> {
  const ImportRoute() : super(ImportRoute.name, path: '/import-page');

  static const String name = 'ImportRoute';
}

/// generated route for
/// [TrackerPage]
class TrackerRouter extends PageRouteInfo<TrackerRouterArgs> {
  TrackerRouter({Key? key})
      : super(TrackerRouter.name,
            path: 'tracker', args: TrackerRouterArgs(key: key));

  static const String name = 'TrackerRouter';
}

class TrackerRouterArgs {
  const TrackerRouterArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'TrackerRouterArgs{key: $key}';
  }
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
