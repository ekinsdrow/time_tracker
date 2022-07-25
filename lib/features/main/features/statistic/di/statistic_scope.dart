import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';
import 'package:time_tracker/features/main/features/statistic/bloc/statistic_bloc.dart';

class StatisticScope extends StatelessWidget {
  const StatisticScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticBloc(
        activities: context.read<List<Activity>>(),
      ),
      child: BlocBuilder<StatisticBloc, StatisticState>(
        builder: (context, state) => state.when(
          statistic: (categories) => Provider.value(
            value: categories,
            child: child,
          ),
        ),
      ),
    );
  }
}
