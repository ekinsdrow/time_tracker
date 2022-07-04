import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/common/errors/errors_strings.dart';
import 'package:time_tracker/features/main/features/history/data/models/activity.dart';
import 'package:time_tracker/features/main/features/history/data/repository/history_repository.dart';

part 'history_state.dart';
part 'history_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final IHistoryRepository historyRepository;
  final String userId;

  late StreamSubscription _sub;

  HistoryCubit({
    required this.historyRepository,
    required this.userId,
  }) : super(const HistoryState.loading()) {
    _sub = historyRepository.getActivities(userId: userId).listen(
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
