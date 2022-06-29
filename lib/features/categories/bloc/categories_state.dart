part of 'categories_bloc.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.success({
    required Categories categories,
  }) = _Success;
  const factory CategoriesState.loading() = _Loading;
  const factory CategoriesState.error({
    required String error,
  }) = _Error;
}
