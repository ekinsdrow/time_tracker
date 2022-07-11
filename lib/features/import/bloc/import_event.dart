part of 'import_bloc.dart';

@freezed
class ImportEvent with _$ImportEvent {
  const factory ImportEvent.save({
    required List<Activity> activities,
  }) = _Save;
}
