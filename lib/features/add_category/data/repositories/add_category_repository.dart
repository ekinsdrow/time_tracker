import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/features/add_category/data/models/add_category.dart';

abstract class IAddRepository {
  Future<String> addCategory({
    required AddCategory category,
  });
}

class AddRepository implements IAddRepository {
  @override
  Future<String> addCategory({
    required AddCategory category,
  }) async {
    final categories = FirebaseFirestore.instance.collection('categories');
    final doc = await categories.add(category.toJson());
    return doc.id;
  }
}
