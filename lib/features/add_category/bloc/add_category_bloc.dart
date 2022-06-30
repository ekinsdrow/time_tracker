import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/common/errors/errors_strings.dart';
import 'package:time_tracker/features/add_category/data/models/add_category.dart';
import 'package:time_tracker/features/add_category/data/repositories/add_category_repository.dart';

part 'add_category_event.dart';
part 'add_category_state.dart';
part 'add_category_bloc.freezed.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  final IAddRepository addRepository;

  AddCategoryBloc({
    required this.addRepository,
  }) : super(const _Initial()) {
    on<AddCategoryEvent>(_add);
  }

  Future<void> _add(
    AddCategoryEvent event,
    Emitter<AddCategoryState> emit,
  ) async {
    emit(const _Loading());

    try {
      final id = await addRepository.addCategory(
        category: AddCategory(
          allDuration: 0,
          name: event.name,
          rootId: event.rootCategoryId,
          subCategoriesIds: [],
          userId: event.userId,
        ),
      );

      emit(
        _Success(
          id: id,
        ),
      );
    } catch (e) {
      emit(
        const _Error(error: ErrorsStrings.addError),
      );
    }

    emit(const _Initial());
  }
}
