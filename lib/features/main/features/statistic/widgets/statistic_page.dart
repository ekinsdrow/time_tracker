import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/extensions/date_time.dart';
import 'package:time_tracker/common/extensions/string.dart';
import 'package:time_tracker/features/app/data/models/time.dart';
import 'package:time_tracker/features/categories/data/models/categories.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
import 'package:time_tracker/features/main/features/history/data/models/activity.dart';

enum StatisticTypes {
  day,
  week,
  month,
  year,
  custom,
}

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  var _type = StatisticTypes.day;
  var _dateTimeRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  void _typeCallback(StatisticTypes type) {
    setState(() {
      _type = type;

      final today = DateTime.now();

      switch (type) {
        case StatisticTypes.day:
          _dateTimeRange = DateTimeRange(
            start: today,
            end: today,
          );
          break;
        case StatisticTypes.week:
          _dateTimeRange = DateTimeRange(
            start: today.subtract(Duration(days: today.weekday - 1)),
            end: today.subtract(Duration(days: today.weekday - 1)).add(
                  const Duration(days: 6),
                ),
          );
          break;
        case StatisticTypes.month:
          _dateTimeRange = DateTimeRange(
            start: DateTime(
              today.year,
              today.month,
              1,
            ),
            end: DateTime(
              today.year,
              today.month,
              DateTime(today.year, today.month + 1, 0).day,
            ),
          );
          break;
        case StatisticTypes.year:
          _dateTimeRange = DateTimeRange(
            start: DateTime(
              today.year,
              1,
              1,
            ),
            end: DateTime(
              today.year,
              12,
              31,
            ),
          );
          break;
        case StatisticTypes.custom:
          _dateTimeRange = DateTimeRange(
            start: today.subtract(
              const Duration(days: 1),
            ),
            end: today,
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<Categories>().categories;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _Type(
            type: _type,
            callback: _typeCallback,
          ),
          const SizedBox(
            height: Constants.mediumPadding,
          ),
          DatePicker(
            dateTimeRange: _dateTimeRange,
            callbackType: (type) {
              setState(() {
                _typeCallback(type);
              });
            },
            callback: (range) {
              setState(() {
                _dateTimeRange = range;
              });
            },
            statisticTypes: _type,
          ),
          const SizedBox(
            height: Constants.mediumPadding * 1.5,
          ),
          _Chart(
            categories: context.watch<Categories>().categories,
            activities: [
              for (int i = 0; i < 10; i++)
                Activity(
                  categoryId:
                      categories[Random().nextInt(categories.length)].id,
                  duration: Random().nextInt(100000),
                  endTimestamp: DateTime.now(),
                ),
            ],
          ),
          const SizedBox(
            height: Constants.mediumPadding,
          ),
          _Categories(
            categories: categories,
          ),
        ],
      ),
    );
  }
}

class _Type extends StatelessWidget {
  const _Type({
    required this.type,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final StatisticTypes type;
  final Function(StatisticTypes type) callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final borderRadius = index == 0
              ? const BorderRadius.only(
                  topLeft: Radius.circular(
                    Constants.smallPadding,
                  ),
                  bottomLeft: Radius.circular(
                    Constants.smallPadding,
                  ),
                )
              : (index == StatisticTypes.values.length - 1
                  ? const BorderRadius.only(
                      topRight: Radius.circular(
                        Constants.smallPadding,
                      ),
                      bottomRight: Radius.circular(
                        Constants.smallPadding,
                      ),
                    )
                  : BorderRadius.zero);

          return InkWell(
            onTap: () {
              callback(
                StatisticTypes.values[index],
              );
            },
            borderRadius: borderRadius,
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.mediumPadding,
              ),
              decoration: BoxDecoration(
                color: type == StatisticTypes.values[index]
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withAlpha(100),
                borderRadius: borderRadius,
              ),
              alignment: Alignment.center,
              child: Text(
                StatisticTypes.values[index].name.capitalize,
                style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
          );
        },
        itemCount: StatisticTypes.values.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  const DatePicker({
    required this.callback,
    required this.dateTimeRange,
    required this.statisticTypes,
    required this.callbackType,
    Key? key,
  }) : super(key: key);

  final StatisticTypes statisticTypes;
  final DateTimeRange dateTimeRange;
  final Function(DateTimeRange range) callback;
  final Function(StatisticTypes type) callbackType;

  Future<void> _choose(BuildContext context) async {
    final ctx = context;

    if (statisticTypes == StatisticTypes.day) {
      final picked = await showDatePicker(
        context: context,
        initialDate: dateTimeRange.start,
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

      if (picked != null) {
        callback(DateTimeRange(start: picked, end: picked));
      }
    } else {
      final picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050),
        initialDateRange: dateTimeRange,
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

      if (picked != null) {
        callbackType(
          StatisticTypes.custom,
        );
        callback(picked);
      }
    }
  }

  void _subtract() {
    switch (statisticTypes) {
      case StatisticTypes.day:
        callback(
          DateTimeRange(
            start: dateTimeRange.start.subtract(const Duration(days: 1)),
            end: dateTimeRange.end.subtract(const Duration(days: 1)),
          ),
        );
        break;
      case StatisticTypes.week:
        callback(
          DateTimeRange(
            start: dateTimeRange.start.subtract(const Duration(days: 7)),
            end: dateTimeRange.end.subtract(const Duration(days: 7)),
          ),
        );
        break;
      case StatisticTypes.month:
        callback(
          DateTimeRange(
            start: DateTime(
              dateTimeRange.start.year,
              dateTimeRange.start.month - 1,
              1,
            ),
            end: DateTime(
              dateTimeRange.end.year,
              dateTimeRange.end.month - 1,
              DateTime(dateTimeRange.end.year, dateTimeRange.end.month, 0).day,
            ),
          ),
        );
        break;
      case StatisticTypes.year:
        callback(
          DateTimeRange(
            start: DateTime(dateTimeRange.start.year - 1, 1, 1),
            end: DateTime(dateTimeRange.end.year - 1, 12, 31),
          ),
        );
        break;
      case StatisticTypes.custom:
        break;
    }
  }

  void _add() {
    switch (statisticTypes) {
      case StatisticTypes.day:
        callback(
          DateTimeRange(
            start: dateTimeRange.start.add(const Duration(days: 1)),
            end: dateTimeRange.end.add(const Duration(days: 1)),
          ),
        );
        break;
      case StatisticTypes.week:
        callback(
          DateTimeRange(
            start: dateTimeRange.start.add(const Duration(days: 7)),
            end: dateTimeRange.end.add(const Duration(days: 7)),
          ),
        );
        break;
      case StatisticTypes.month:
        callback(
          DateTimeRange(
            start: DateTime(
              dateTimeRange.start.year,
              dateTimeRange.start.month + 1,
              1,
            ),
            end: DateTime(
              dateTimeRange.end.year,
              dateTimeRange.end.month + 1,
              DateTime(dateTimeRange.end.year, dateTimeRange.end.month + 2, 0)
                  .day,
            ),
          ),
        );
        break;
      case StatisticTypes.year:
        callback(
          DateTimeRange(
            start: DateTime(dateTimeRange.start.year + 1, 1, 1),
            end: DateTime(dateTimeRange.end.year + 1, 12, 31),
          ),
        );
        break;
      case StatisticTypes.custom:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(Constants.smallPadding);

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          if (statisticTypes != StatisticTypes.custom)
            Material(
              borderRadius: const BorderRadius.only(
                topLeft: radius,
                bottomLeft: radius,
              ),
              color: Theme.of(context).primaryColor,
              child: InkWell(
                borderRadius: const BorderRadius.only(
                  topLeft: radius,
                  bottomLeft: radius,
                ),
                onTap: _subtract,
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.transparent,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: InkWell(
              onTap: () {
                _choose(context);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: statisticTypes == StatisticTypes.custom
                      ? BorderRadius.circular(Constants.smallPadding)
                      : BorderRadius.zero,
                ),
                child: Center(
                  child: Text(
                    statisticTypes == StatisticTypes.day
                        ? dateTimeRange.start.formatDate
                        // ignore: lines_longer_than_80_chars
                        : '${dateTimeRange.start.formatDate} - ${dateTimeRange.end.formatDate}',
                  ),
                ),
              ),
            ),
          ),
          if (statisticTypes != StatisticTypes.custom)
            Material(
              borderRadius: const BorderRadius.only(
                topRight: radius,
                bottomRight: radius,
              ),
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: _add,
                borderRadius: const BorderRadius.only(
                  topRight: radius,
                  bottomRight: radius,
                ),
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.transparent,
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart({
    required this.activities,
    required this.categories,
    Key? key,
  }) : super(key: key);

  final List<Activity> activities;
  final List<CategoryLeaf> categories;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width - 200;
    int all = 0;

    for (final cat in categories) {
      all += cat.allDuration;
    }

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sections: [
                for (final category in categories)
                  PieChartSectionData(
                    value: category.allDuration.toDouble(),
                    title: category.name,
                    color: Theme.of(context).primaryColor,
                    titleStyle: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                Time.fromDuration(duration: all).format,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: all time
class _Categories extends StatelessWidget {
  const _Categories({
    required this.categories,
    Key? key,
  }) : super(key: key);

  final List<CategoryLeaf> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final category in categories)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: Constants.smallPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    Time.fromDuration(duration: category.allDuration).format,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              for (final sub in category.subCategories)
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: Constants.smallPadding,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                sub.name,
                              ),
                              Text(
                                Time.fromDuration(duration: sub.allDuration)
                                    .format,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
      ],
    );
  }
}
