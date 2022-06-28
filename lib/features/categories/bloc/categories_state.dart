part of 'categories_bloc.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial({
    required List<Category> categories,
  }) = _Initial;

  const factory CategoriesState.error({
    required String error,
  }) = _Error;
}
