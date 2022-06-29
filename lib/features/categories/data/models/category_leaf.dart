import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/features/categories/data/models/category.dart';

part 'category_leaf.freezed.dart';

@freezed
class CategoryLeaf with _$CategoryLeaf {
  factory CategoryLeaf({
    required Category category,
    required List<CategoryLeaf> subCategories,
  }) = _CategoryLeaf;
}

extension CategoryLeafGetters on CategoryLeaf {
  int get allDuration => category.allDuration;
  String get id => category.id;
  String get name => category.name;
  bool get isRoot => category.rootId == '-1';
  String get userId => category.userId;
  bool get haveSubCategories => subCategories.isNotEmpty;
}
