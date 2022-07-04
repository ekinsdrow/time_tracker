part of 'add_activity_bloc.dart';

@freezed
class AddActivityEvent with _$AddActivityEvent {
  const factory AddActivityEvent.save({
    required Time time,
    required DateTime dateTime,
    required String userId,
    required CategoryLeaf categoryLeaf,
  }) = _Save;
}
