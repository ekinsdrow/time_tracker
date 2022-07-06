part of 'statistic_bloc.dart';

@freezed
class StatisticState with _$StatisticState {
  const factory StatisticState.statistic({
    required List<StatisticCategory> statisticCategories,
  }) = _Statistic;
}
