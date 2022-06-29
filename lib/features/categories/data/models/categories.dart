import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/features/categories/data/models/category.dart';

part 'categories.freezed.dart';

@freezed
class Categories with _$Categories {
  factory Categories({
    required List<Category> categories,
  }) = _Categories;
}

extension CategoryFilters on Categories {
  
}
