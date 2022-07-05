import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/common/errors/errors_strings.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';
import 'package:time_tracker/features/activity/data/repository/activity_repository.dart';

part 'activity_state.dart';
part 'actvity_cubit.freezed.dart';

class ActivityCubit extends Cubit<ActivityState> {
  final IActivityRepository activityRepository;
  final String userId;

  late StreamSubscription _sub;

  ActivityCubit({
    required this.activityRepository,
    required this.userId,
  }) : super(const ActivityState.loading()) {
    _sub = activityRepository.getActivities(userId: userId).listen(
      (event) {
        emit(
          _Success(activities: event),
        );
      },
    )..onError(
        (_) {
          emit(
            const _Error(error: ErrorsStrings.fetchError),
          );
        },
      );
  }

  @override
  Future<void> close() async {
    _sub.cancel();
    super.close();
  }
}
