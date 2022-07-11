import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/extensions/date_time.dart';
import 'package:time_tracker/common/widgets/activity_item.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';
import 'package:time_tracker/features/app/router/router.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';

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
    return Column(
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
        Expanded(
          child: Builder(
            builder: (context) {
              Iterable<Activity> act = context.read<List<Activity>>();
              if (_chooseDate != null) {
                act = act.where(
                  (element) =>
                      element.endTimestamp.formatDate ==
                      _chooseDate!.formatDate,
                );
              }

              if (_categoryLeaf != null) {
                act = act.where(
                  (element) {
                    if (element.categoryId == _categoryLeaf!.id) {
                      return true;
                    }

                    if (_categoryLeaf!.isRoot) {
                      for (final sub in _categoryLeaf!.subCategories) {
                        if (sub.id == element.categoryId) {
                          return true;
                        }
                      }
                    }

                    return false;
                  },
                );
              }

              return _HistoryList(
                activities: act,
              );
            },
          ),
        ),
      ],
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
             

              return ActivityItem(
                activity: activity,
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
