part of 'initial_bloc.dart';

@freezed
class InitialState with _$InitialState {
  const factory InitialState.loading() = _Loading;
  const factory InitialState.success() = _Success;
}
