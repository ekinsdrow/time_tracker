import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/common/errors/errors_strings.dart';
import 'package:time_tracker/features/add_activity/data/models/add_activity_model.dart';
import 'package:time_tracker/features/add_activity/data/models/time.dart';
import 'package:time_tracker/features/add_activity/data/repository/add_activity_repository.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';

part 'add_activity_event.dart';
part 'add_activity_state.dart';
part 'add_activity_bloc.freezed.dart';

class AddActivityBloc extends Bloc<AddActivityEvent, AddActivityState> {
  final IAddActivityRepository activityRepository;

  AddActivityBloc({
    required this.activityRepository,
  }) : super(const _Initial()) {
    on<AddActivityEvent>(_save);
  }

  Future<void> _save(
    AddActivityEvent event,
    Emitter<AddActivityState> emit,
  ) async {
    emit(const _Loading());

    try {
      await activityRepository.addActivity(
        addActivityModel: AddActivityModel(
          duration: event.time.toDuration,
          categoryId: event.subCategoryLeaf != null
              ? event.subCategoryLeaf!.id
              : event.mainCategoryLeaf.id,
          startTimestamp: event.dateTime,
          userId: event.userId,
        ),
        mainCategoryLeaf: event.mainCategoryLeaf,
        subCategoryLeaf: event.subCategoryLeaf,
      );

      emit(
        const _Success(),
      );
    } catch (e) {
      emit(
        const _Error(
          error: ErrorsStrings.saveError,
        ),
      );
    }

    emit(const _Initial());
  }
}
