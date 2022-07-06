import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/features/app/data/models/time.dart';

part 'statistic_category.freezed.dart';
part 'statistic_category.g.dart';

@freezed
class StatisticCategory with _$StatisticCategory {
  factory StatisticCategory({
    required String title,
    required String id,
    required Time time,
    required List<StatisticCategory> subCategories,
  }) = _StatisticCategory;

  factory StatisticCategory.fromJson(Map<String, dynamic> json) =>
      _$StatisticCategoryFromJson(json);
}
