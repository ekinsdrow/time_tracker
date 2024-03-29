import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/features/app/router/router.dart';
import 'package:time_tracker/features/main/di/main_scope.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScope(
      child: AutoTabsRouter(
        routes: [
          TrackerRouter(),
          const HistoryRouter(),
          const StatisticRouter(),
        ],
        builder: (context, child, _) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Constants.mediumPadding,
                  right: Constants.mediumPadding,
                  top: Constants.mediumPadding,
                ),
                child: child,
              ),
            ),
            bottomNavigationBar: _BottomBar(
              activeIndex: tabsRouter.activeIndex,
              callback: (i) {
                tabsRouter.setActiveIndex(i);
              },
            ),
          );
        },
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.activeIndex,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final int activeIndex;
  final Function(int index) callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              splashRadius: 20,
              color: activeIndex == 0
                  ? Theme.of(context).primaryColor
                  : Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
              onPressed: () {
                callback(0);
              },
              icon: const Icon(Icons.timer),
            ),
          ),
          Expanded(
            child: IconButton(
              splashRadius: 20,
              color: activeIndex == 1
                  ? Theme.of(context).primaryColor
                  : Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
              onPressed: () {
                callback(1);
              },
              icon: const Icon(Icons.history),
            ),
          ),
          Expanded(
            child: IconButton(
              splashRadius: 20,
              color: activeIndex == 2
                  ? Theme.of(context).primaryColor
                  : Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
              onPressed: () {
                callback(2);
              },
              icon: const Icon(Icons.auto_graph),
            ),
          ),
        ],
      ),
    );
  }
}
