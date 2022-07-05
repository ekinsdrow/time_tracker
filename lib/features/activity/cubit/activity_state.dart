part of 'actvity_cubit.dart';

@freezed
class ActivityState with _$ActivityState {
  const factory ActivityState.loading() = _Loading;
  const factory ActivityState.error({required String error}) = _Error;
  const factory ActivityState.success({
    required List<Activity> activities,
  }) = _Success;
}
