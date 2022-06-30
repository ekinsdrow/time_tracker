part of 'add_category_bloc.dart';

@freezed
class AddCategoryState with _$AddCategoryState {
  const factory AddCategoryState.initial() = _Initial;
  const factory AddCategoryState.loading() = _Loading;
  const factory AddCategoryState.error({
    required String error,
  }) = _Error;
  const factory AddCategoryState.success({
    required String id,
  }) = _Success;
}
