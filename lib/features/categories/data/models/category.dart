import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  factory Category({
    required int allDuration,
    required String id,
    required String name,
    //-1 if don't have root
    required String? rootId,
    required List<String> subCategoriesIds,
    required String userId,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
