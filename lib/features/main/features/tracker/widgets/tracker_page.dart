import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foreground_stopwatch/foreground_stopwatch.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/extensions/int.dart';
import 'package:time_tracker/features/add_activity/bloc/add_activity_bloc.dart';
import 'package:time_tracker/features/add_activity/di/add_activity_scope.dart';
import 'package:time_tracker/features/app/data/models/time.dart';
import 'package:time_tracker/features/app/router/router.dart';
import 'package:time_tracker/features/categories/data/models/categories.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
import 'package:time_tracker/features/user/data/models/user.dart';

class TrackerPage extends StatelessWidget {
  TrackerPage({Key? key}) : super(key: key);

  final foregroundStopwatch = ForegroundStopwatch();

  @override
  Widget build(BuildContext context) {
    return AddActivityScope(
      child: Column(
        children: [
          const _Header(),
          const SizedBox(
            height: Constants.mediumPadding,
          ),
          StreamBuilder<StopwatchState>(
            stream: foregroundStopwatch.stopwatchStateStream,
            initialData: StopwatchState.zero(),
            builder: (context, snapshot) {
              final state = snapshot.data!;

              if (state.stopwatchStateEnum != StopwatchStateEnum.stop) {
                return Column(
                  children: [
                    _TimerView(
                      foregroundStopwatch: foregroundStopwatch,
                    ),
                    const SizedBox(
                      height: Constants.mediumPadding,
                    ),
                  ],
                );
              }

              return Container();
            },
          ),
          Expanded(
            child: _Categories(
              foregroundStopwatch: foregroundStopwatch,
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Time Tracker',
          style: Theme.of(context).textTheme.headline1,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                context.router.push(
                  const AddActivityRoute(),
                );
              },
              splashRadius: 20,
              icon: const Icon(
                Icons.add,
              ),
            ),
            IconButton(
              onPressed: () {
                context.router.push(
                  const SettingsRoute(),
                );
              },
              splashRadius: 20,
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ],
    );
  }
}

class _TimerView extends StatelessWidget {
  const _TimerView({
    Key? key,
    required this.foregroundStopwatch,
  }) : super(key: key);

  final ForegroundStopwatch foregroundStopwatch;

  void _stop() {
    foregroundStopwatch.stop();
  }

  void _play() {
    foregroundStopwatch.play(data: 'id');
  }

  void _pause() {
    foregroundStopwatch.pause();
  }

  void _save({
    required BuildContext context,
    required Duration duration,
    required String categoryId,
  }) {
    final categories = context.read<Categories>().getPairById(categoryId);

    context.read<AddActivityBloc>().add(
          AddActivityEvent.save(
            time: Time.fromDuration(
              duration: duration.inSeconds,
            ),
            dateTime: DateTime.now(),
            userId: context.read<UserModel>().uid,
            mainCategoryLeaf: categories[0],
            subCategoryLeaf: categories[1],
          ),
        );

    foregroundStopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Colors.red[300]!,
          ],
        ),
        borderRadius: BorderRadius.circular(
          Constants.smallPadding,
        ),
      ),
      padding: const EdgeInsets.all(Constants.smallPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<StopwatchState>(
            stream: foregroundStopwatch.stopwatchStateStream,
            initialData: StopwatchState.zero(),
            builder: (context, snapshot) {
              final state = snapshot.data!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.read<Categories>().categoriesName(state.data),
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  Text(
                    Time.fromDuration(
                      duration: state.duration.inSeconds,
                    ).format,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              );
            },
          ),
          Row(
            children: [
              _IconButton(
                callback: _stop,
                icon: Icons.stop,
              ),
              StreamBuilder<StopwatchState>(
                initialData: StopwatchState.zero(),
                stream: foregroundStopwatch.stopwatchStateStream,
                builder: (context, snapshot) {
                  final state = snapshot.data!;

                  return _IconButton(
                    callback:
                        state.stopwatchStateEnum == StopwatchStateEnum.play
                            ? _pause
                            : _play,
                    icon: state.stopwatchStateEnum == StopwatchStateEnum.play
                        ? Icons.pause
                        : Icons.play_arrow,
                  );
                },
              ),
              StreamBuilder<StopwatchState>(
                initialData: StopwatchState.zero(),
                stream: foregroundStopwatch.stopwatchStateStream,
                builder: (context, snapshot) {
                  final state = snapshot.data!;

                  return _IconButton(
                    callback: () {
                      _save(
                        context: context,
                        duration: state.duration,
                        categoryId: state.data,
                      );
                    },
                    icon: Icons.save,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.callback,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final VoidCallback callback;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: callback,
        child: Container(
          color: Colors.transparent,
          width: 30,
          height: 30,
          child: Icon(
            icon,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories({
    Key? key,
    required this.foregroundStopwatch,
  }) : super(key: key);

  final ForegroundStopwatch foregroundStopwatch;

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<Categories>().categories;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (categories.length == index) {
          return Material(
            color: Theme.of(context).hintColor,
            borderRadius: BorderRadius.circular(
              Constants.smallPadding,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(
                Constants.smallPadding,
              ),
              onTap: () {
                context.router.push(
                  AddCategoryRoute(
                    user: context.read<UserModel>(),
                    startRootId: "-1",
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.mediumPadding - 5,
                  vertical: Constants.mediumPadding,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    Constants.smallPadding,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add),
                      const SizedBox(
                        width: Constants.smallPadding,
                      ),
                      Text(
                        'Add category',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return _Category(
          categoryLeaf: categories[index],
          foregroundStopwatch: foregroundStopwatch,
        );
      },
      separatorBuilder: (_, __) => const SizedBox(
        height: Constants.mediumPadding,
      ),
      itemCount: categories.length + 1,
    );
  }
}

class _Category extends StatefulWidget {
  const _Category({
    Key? key,
    required this.categoryLeaf,
    required this.foregroundStopwatch,
  }) : super(key: key);

  final CategoryLeaf categoryLeaf;
  final ForegroundStopwatch foregroundStopwatch;

  @override
  State<_Category> createState() => _CategoryState();
}

class _CategoryState extends State<_Category> {
  bool _isOpen = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StopwatchState>(
      stream: widget.foregroundStopwatch.stopwatchStateStream,
      initialData: StopwatchState.zero(),
      builder: (context, snapshot) {
        final state = snapshot.data!;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.mediumPadding - 5,
            vertical: Constants.mediumPadding,
          ),
          decoration: BoxDecoration(
            color: state.data == widget.categoryLeaf.id
                ? Theme.of(context).primaryColor.withAlpha(100)
                : Theme.of(context).hintColor,
            borderRadius: BorderRadius.circular(
              Constants.smallPadding,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isOpen = !_isOpen;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Text(
                            widget.categoryLeaf.name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(
                            width: Constants.smallPadding,
                          ),
                          RotatedBox(
                            quarterTurns: _isOpen ? 2 : 0,
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.foregroundStopwatch.play(
                            data: widget.categoryLeaf.id,
                          );
                        },
                        icon: const Icon(
                          Icons.timer,
                        ),
                        splashRadius: 20,
                      ),
                      Text(
                        state.data == widget.categoryLeaf.id
                            ? (widget.categoryLeaf.allDuration +
                                    state.duration.inSeconds)
                                .toTime
                            : widget.categoryLeaf.allDuration.toTime,
                      ),
                    ],
                  ),
                ],
              ),
              if (_isOpen)
                Column(
                  children: [
                    const SizedBox(
                      height: Constants.mediumPadding,
                    ),
                    _SubCategories(
                      categories: widget.categoryLeaf.subCategories,
                      rootCategoryId: widget.categoryLeaf.id,
                      foregroundStopwatch: widget.foregroundStopwatch,
                    ),
                    const SizedBox(
                      height: Constants.mediumPadding,
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SubCategories extends StatelessWidget {
  const _SubCategories({
    required this.categories,
    required this.rootCategoryId,
    required this.foregroundStopwatch,
    Key? key,
  }) : super(key: key);

  final List<CategoryLeaf> categories;
  final String rootCategoryId;
  final ForegroundStopwatch foregroundStopwatch;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Constants.smallPadding,
      runSpacing: Constants.smallPadding,
      children: [
        for (int i = 0; i < categories.length; i++)
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 -
                Constants.mediumPadding * 2,
            child: _SubCategory(
              foregroundStopwatch: foregroundStopwatch,
              categoryLeaf: categories[i],
            ),
          ),
        Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(Constants.smallPadding),
          child: InkWell(
            borderRadius: BorderRadius.circular(Constants.smallPadding),
            onTap: () {
              context.router.push(
                AddCategoryRoute(
                  user: context.read<UserModel>(),
                  startRootId: rootCategoryId,
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2 -
                  Constants.mediumPadding * 2,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(Constants.smallPadding),
              ),
              padding: const EdgeInsets.all(Constants.smallPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Add category'),
                  Icon(
                    Icons.add,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SubCategory extends StatelessWidget {
  const _SubCategory({
    required this.categoryLeaf,
    required this.foregroundStopwatch,
    Key? key,
  }) : super(key: key);

  final CategoryLeaf categoryLeaf;
  final ForegroundStopwatch foregroundStopwatch;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StopwatchState>(
      stream: foregroundStopwatch.stopwatchStateStream,
      initialData: StopwatchState.zero(),
      builder: (context, snapshot) {
        final state = snapshot.data!;

        return Material(
          color: state.data == categoryLeaf.id
              ? Theme.of(context).primaryColor.withAlpha(100)
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(Constants.smallPadding),
          child: InkWell(
            borderRadius: BorderRadius.circular(Constants.smallPadding),
            onTap: () {
              foregroundStopwatch.play(
                data: categoryLeaf.id,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(Constants.smallPadding),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              height: 43,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categoryLeaf.name,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        state.data == categoryLeaf.id
                            ? (categoryLeaf.allDuration +
                                    state.duration.inSeconds)
                                .toTime
                            : categoryLeaf.allDuration.toTime,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
