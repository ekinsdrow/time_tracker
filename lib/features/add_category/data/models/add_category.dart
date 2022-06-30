import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_category.freezed.dart';
part 'add_category.g.dart';

@freezed
class AddCategory with _$AddCategory {
  factory AddCategory({
    required int allDuration,
    required String name,
    required String rootId,
    required List<String> subCategoriesIds,
    required String userId,
  }) = _AddCategory;

  factory AddCategory.fromJson(Map<String, dynamic> json) =>
      _$AddCategoryFromJson(json);
}
