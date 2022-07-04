part of 'add_activity_bloc.dart';

@freezed
class AddActivityState with _$AddActivityState {
  const factory AddActivityState.initial() = _Initial;
  const factory AddActivityState.loading() = _Loading;
  const factory AddActivityState.error({
    required String error,
  }) = _Error;
  const factory AddActivityState.success() = _Success;
}
