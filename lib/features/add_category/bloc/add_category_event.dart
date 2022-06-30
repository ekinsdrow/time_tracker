part of 'add_category_bloc.dart';

@freezed
class AddCategoryEvent with _$AddCategoryEvent {
  const factory AddCategoryEvent.add({
    required String name,
    required String rootCategoryId,
    required String userId,
  }) = _Add;
}
