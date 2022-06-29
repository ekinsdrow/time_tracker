import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/features/categories/data/models/category.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';

part 'categories.freezed.dart';

@freezed
class Categories with _$Categories {
  factory Categories({
    required List<CategoryLeaf> categories,
  }) = _Categories;

  factory Categories.fromCategoryList({
    required List<Category> categories,
  }) {
    final result = <CategoryLeaf>[];

    for (final category in categories) {
      if (category.rootId == '-1') {
        final subs = categories.where(
          (element) => element.rootId == category.id,
        );

    
        result.add(
          CategoryLeaf(
            category: category,
            subCategories: [
              for (final subCategory in subs)
                CategoryLeaf(
                  category: subCategory,
                  subCategories: [],
                )
            ],
          ),
        );
      }
    }

    return Categories(
      categories: result,
    );
  }
}
