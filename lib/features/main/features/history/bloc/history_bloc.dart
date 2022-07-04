import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/common/errors/errors_strings.dart';
import 'package:time_tracker/features/main/features/history/data/models/activity.dart';
import 'package:time_tracker/features/main/features/history/data/repository/history_repository.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final IHistoryRepository historyRepository;

  HistoryBloc({
    required this.historyRepository,
  }) : super(const _Loading()) {
    on<HistoryEvent>(_fetch);
  }

  Future<void> _fetch(
    HistoryEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const _Loading());

    try {
      historyRepository.getActivities(userId: event.userId).listen(
        (event) {
          emit(
            _Success(activities: event),
          );
        },
      ).onError(
        (_) {
          emit(
            const _Error(error: ErrorsStrings.fetchError),
          );
        },
      );
    } catch (e) {
      emit(
        const _Error(error: ErrorsStrings.fetchError),
      );
    }
  }
}
