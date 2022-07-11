part of 'import_bloc.dart';

@freezed
class ImportState with _$ImportState {
  const factory ImportState.initial() = _Initial;
  const factory ImportState.loading() = _Loading;
  const factory ImportState.success() = _Sucess;
  const factory ImportState.error({
    required String error,
  }) = _Error;
}
