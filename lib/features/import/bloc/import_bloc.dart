import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
import 'package:time_tracker/features/import/data/import_repository.dart';

part 'import_event.dart';
part 'import_state.dart';
part 'import_bloc.freezed.dart';

class ImportBloc extends Bloc<ImportEvent, ImportState> {
  final IImportRepository importRepository;

  ImportBloc({
    required this.importRepository,
  }) : super(const _Initial()) {
    on<ImportEvent>(_save);
  }

  Future<void> _save(
    ImportEvent event,
    Emitter<ImportState> emit,
  ) async {
    emit(const _Loading());
    try {
      await importRepository.save(
        activities: event.activities,
        categories: event.categories,
        userId: event.userId,
      );

      emit(const _Sucess());
    } catch (e) {
      emit(
        _Error(error: e.toString()),
      );
    }
  }
}
