import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/features/categories/data/models/category.dart';

abstract class ICategoriesRepository {
  Future<List<Category>> categories();
}

class CategoriesRepository implements ICategoriesRepository {
  @override
  Future<List<Category>> categories() async {
    final categories = <Category>[];

    final collection =
        await FirebaseFirestore.instance.collection('categories').get();

    for (final doc in collection.docs) {
      final data = doc.data();
      data['id'] = doc.id;
      
      categories.add(
        Category.fromJson(
          data,
        ),
      );
    }

    return categories;
  }
}
