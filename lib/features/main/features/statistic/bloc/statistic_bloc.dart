import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';
import 'package:time_tracker/features/app/data/models/time.dart';
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

    final suitableActivities = <Activity>[];

    for (final activity in activities) {
      final date = activity.endTimestamp;

      final start = DateTime(
        event.range.start.year,
        event.range.start.month,
        event.range.start.day,
      );

      final end = DateTime(
        event.range.end.year,
        event.range.end.month,
        event.range.end.day,
        23,
        59,
        59,
      );

      if (date.isAfter(start) && date.isBefore(end)) {
        suitableActivities.add(activity);
      }
    }

    //id:Duration
    final durationMap = <String, int>{};

    for (final activity in suitableActivities) {
      final start = durationMap[activity.categoryId] ?? 0;
      durationMap[activity.categoryId] = start + activity.duration;
    }

    for (final cat in categories) {
      if (durationMap.containsKey(cat.id)) {
        final category = StatisticCategory(
          title: cat.name,
          id: cat.id,
          time: Time.fromDuration(
            duration: durationMap[cat.id]!,
          ),
          subCategories: [
            for (final sub in cat.subCategories)
              if (durationMap.containsKey(sub.id))
                StatisticCategory(
                  title: sub.name,
                  id: sub.id,
                  time: Time.fromDuration(
                    duration: durationMap[sub.id]!,
                  ),
                  subCategories: [],
                ),
          ],
        );

        var allCatDuration = category.time.toDuration;

        for (final sub in category.subCategories) {
          allCatDuration += sub.time.toDuration;
        }

        statisticCategories.add(
          category.copyWith(
            time: Time.fromDuration(duration: allCatDuration),
          ),
        );
      }
    }

    emit(
      _Statistic(
        statisticCategories: statisticCategories.toList(),
      ),
    );
  }

  void addCategory({
    required List<StatisticCategory> statisticCategories,
    required List<Activity> suitableActivities,
    required CategoryLeaf category,
    required int index,
  }) {
    final statIndex =
        statisticCategories.indexWhere((element) => element.id == category.id);

    if (statIndex != -1) {
      statisticCategories[statIndex] = statisticCategories[statIndex].copyWith(
        time: Time.fromDuration(
          duration: statisticCategories[statIndex].time.toDuration +
              suitableActivities[index].duration,
        ),
      );
    } else {
      statisticCategories.add(
        StatisticCategory(
          title: category.name,
          time: Time.fromDuration(
            duration: suitableActivities[index].duration,
          ),
          subCategories: [],
          id: category.id,
        ),
      );
    }
  }
}
