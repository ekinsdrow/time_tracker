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

    //id:Duration
    final durationMap = <String, int>{};

    for (final activity in activities) {
      final date = DateTime(
        activity.endTimestamp.year,
        activity.endTimestamp.month,
        activity.endTimestamp.day,
        12,
        0,
      );

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
        final start = durationMap[activity.categoryId] ?? 0;
        durationMap[activity.categoryId] = start + activity.duration;
      }
    }

    for (final cat in categories) {
      if (durationMap.keys.contains(cat.id)) {
        final category = StatisticCategory(
          title: cat.name,
          id: cat.id,
          time: Time.fromDuration(
            duration: durationMap[cat.id]!,
          ),
          subCategories: [],
        );

        statisticCategories.add(category);
      } else {
        for (final sub in cat.subCategories) {
          if (durationMap.keys.contains(sub.id)) {
            final subCategory = StatisticCategory(
              title: sub.name,
              id: sub.id,
              time: Time.fromDuration(
                duration: durationMap[sub.id]!,
              ),
              subCategories: [],
            );

            final index = statisticCategories
                .indexWhere((element) => element.id == cat.id);

            if (index != -1) {
              statisticCategories[index] = statisticCategories[index].copyWith(
                time: Time.fromDuration(
                  duration: statisticCategories[index].time.toDuration +
                      subCategory.time.toDuration,
                ),
                subCategories: [
                  ...statisticCategories[index].subCategories,
                  subCategory,
                ],
              );
            } else {
              final category = StatisticCategory(
                title: cat.name,
                id: cat.id,
                time: Time.fromDuration(
                  duration: durationMap[sub.id]!,
                ),
                subCategories: [
                  subCategory,
                ],
              );

              statisticCategories.add(
                category,
              );
            }
          }
        }
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
