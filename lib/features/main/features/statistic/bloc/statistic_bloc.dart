import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
import 'package:time_tracker/features/main/features/statistic/models/statistic_category.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';
part 'statistic_bloc.freezed.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final List<CategoryLeaf> categories;
  final List<Activity> activities;

  StatisticBloc({
    required this.activities,
    required this.categories,
  }) : super(
          const _Statistic(
            statisticCategories: [],
          ),
        ) {
    on<StatisticEvent>(_calc);
  }

  Future<void> _calc(
    StatisticEvent event,
    Emitter<StatisticState> emit,
  ) async {
    final statisticCategories = <StatisticCategory>[];

    //TODO: logic

    emit(
      _Statistic(
        statisticCategories: statisticCategories,
      ),
    );
  }
}
