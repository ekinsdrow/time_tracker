import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/common/errors/errors_strings.dart';
import 'package:time_tracker/features/categories/data/models/category.dart';
import 'package:time_tracker/features/categories/data/repositories/categories_repository.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final ICategoriesRepository categoriesRepository;

  CategoriesBloc({
    required this.categoriesRepository,
  }) : super(
          const _Initial(
            categories: [],
          ),
        ) {
    on<CategoriesEvent>(_fetch);
  }

  Future<void> _fetch(
    CategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    try {
      final categories = await categoriesRepository.categories();

      emit(
        _Initial(categories: categories),
      );
    } catch (e) {
      emit(
        const _Error(
          error: ErrorsStrings.categotyError,
        ),
      );
    }
  }
}
