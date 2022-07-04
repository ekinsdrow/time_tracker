import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/features/add_activity/data/models/add_activity_model.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';

abstract class IAddActivityRepository {
  Future<void> addActivity({
    required AddActivityModel addActivityModel,
    required CategoryLeaf mainCategoryLeaf,
    required CategoryLeaf? subCategoryLeaf,
  });
}

class AddActivityRepository implements IAddActivityRepository {
  @override
  Future<void> addActivity({
    required AddActivityModel addActivityModel,
    required CategoryLeaf mainCategoryLeaf,
    required CategoryLeaf? subCategoryLeaf,
  }) async {
    final db = FirebaseFirestore.instance;
    final batch = db.batch();

    final activity = db.collection('activities').doc();
    batch.set(
      activity,
      addActivityModel.toJson(),
    );

    final mainCategory = db.collection('categories').doc(mainCategoryLeaf.id);
    batch.update(
      mainCategory,
      {
        'allDuration': mainCategoryLeaf.allDuration + addActivityModel.duration,
      },
    );

    if (subCategoryLeaf != null) {
      final subCategory = db.collection('categories').doc(subCategoryLeaf.id);
      batch.update(
        subCategory,
        {
          'allDuration':
              subCategoryLeaf.allDuration + addActivityModel.duration,
        },
      );
    }

    return await batch.commit();
  }
}
