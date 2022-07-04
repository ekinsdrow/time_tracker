import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/extensions/date_time.dart';
import 'package:time_tracker/features/app/data/models/time.dart';
import 'package:time_tracker/features/app/router/router.dart';
import 'package:time_tracker/features/categories/data/models/categories.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
import 'package:time_tracker/features/main/features/history/cubit/history_cubit.dart';
import 'package:time_tracker/features/main/features/history/data/models/activity.dart';
import 'package:time_tracker/features/main/features/history/di/history_scope.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime? _chooseDate;
  CategoryLeaf? _categoryLeaf;

  @override
  Widget build(BuildContext context) {
    return HistoryScope(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Header(),
          const SizedBox(
            height: Constants.mediumPadding,
          ),
          _Filters(
            date: _chooseDate,
            categoryCallback: (c) {
              setState(() {
                _categoryLeaf = c;
              });
            },
            categoryLeaf: _categoryLeaf,
            dateCallback: (d) {
              setState(() {
                _chooseDate = d;
              });
            },
          ),
          const SizedBox(
            height: Constants.mediumPadding,
          ),
          Builder(
            builder: (context) {
              return Expanded(
                child: BlocBuilder<HistoryCubit, HistoryState>(
                  builder: (context, state) => state.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error) => Center(
                      child: Text(error),
                    ),
                    success: (activities) {
                      Iterable<Activity> act = activities;
                      if (_chooseDate != null) {
                        act = activities.where(
                          (element) =>
                              element.endTimestamp.formatDate ==
                              _chooseDate!.formatDate,
                        );
                      }

                      if (_categoryLeaf != null) {
                        act = act.where(
                          (element) => element.categoryId == _categoryLeaf!.id,
                        );
                      }

                      return _HistoryList(
                        activities: act,
                      );
                    },
                  ),
                ),
              );
            },
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
    return Text(
      'History',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class _Filters extends StatelessWidget {
  const _Filters({
    Key? key,
    required this.date,
    required this.dateCallback,
    required this.categoryCallback,
    required this.categoryLeaf,
  }) : super(key: key);

  final DateTime? date;
  final Function(DateTime?) dateCallback;
  final CategoryLeaf? categoryLeaf;
  final Function(CategoryLeaf?) categoryCallback;

  void _openDateFilter(BuildContext context) async {
    final ctx = context;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (context, child) => Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Theme.of(ctx).primaryColor,
            onPrimary: Theme.of(ctx).scaffoldBackgroundColor,
            onSurface: Theme.of(ctx).textTheme.bodyText2!.color!,
          ),
        ),
        child: child!,
      ),
    );

    dateCallback(pickedDate);
  }

  void _clearDate() {
    dateCallback(null);
  }

  void _clearCategory() {
    categoryCallback(null);
  }

  Future<void> _openCategory(BuildContext context) async {
    final category = await context.router.push(
      const CategoryFilterRoute(),
    );

    if (category != null) {
      if (category is CategoryLeaf) {
        categoryCallback(category);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            _openDateFilter(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                date != null ? date!.formatDate : 'Date',
              ),
              if (date != null)
                Row(
                  children: [
                    const SizedBox(
                      width: Constants.smallPadding / 2,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: _clearDate,
                      child: const Icon(
                        Icons.clear,
                        size: 18,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(
          width: Constants.smallPadding,
        ),
        ElevatedButton(
          onPressed: () {
            _openCategory(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                categoryLeaf != null ? categoryLeaf!.name : 'Category',
              ),
              if (categoryLeaf != null)
                Row(
                  children: [
                    const SizedBox(
                      width: Constants.smallPadding / 2,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: _clearCategory,
                      child: const Icon(
                        Icons.clear,
                        size: 18,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HistoryList extends StatelessWidget {
  const _HistoryList({
    required this.activities,
    Key? key,
  }) : super(key: key);

  final Iterable<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
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
                const AddActivityRoute(),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                  ),
                  SizedBox(
                    width: Constants.smallPadding,
                  ),
                  Text(
                    'Add Activity',
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: Constants.smallPadding,
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final activity = activities.elementAt(index);
              final categories = context.read<Categories>();
              final categoryStr = categories.categoriesName(
                activity.categoryId,
              );

              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor,
                  borderRadius: BorderRadius.circular(
                    Constants.smallPadding,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    // ignore: lines_longer_than_80_chars
                    '$categoryStr - ${Time.fromDuration(duration: activity.duration).format}',
                  ),
                  subtitle: Text(
                    activity.endTimestamp.formatDate,
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: Constants.smallPadding,
            ),
            itemCount: activities.length,
          ),
        ),
      ],
    );
  }
}
