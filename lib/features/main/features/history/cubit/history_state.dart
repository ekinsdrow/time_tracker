part of 'history_cubit.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.loading() = _Loading;
  const factory HistoryState.error({required String error}) = _Error;
  const factory HistoryState.success({
    required List<Activity> activities,
  }) = _Success;
}
