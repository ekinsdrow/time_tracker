import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';

abstract class IImportRepository {
  Future<void> save({
    required List<CategoryLeaf> categories,
    required List<Activity> activities,
    required String userId,
  });
}

class ImportRepository implements IImportRepository {
  @override
  Future<void> save({
    required List<Activity> activities,
    required List<CategoryLeaf> categories,
    required String userId,
  }) async {
    final db = FirebaseFirestore.instance;

    final catMap = <String, int>{};

    //Update activities
    var batch = db.batch();

    for (int j = 0; j < activities.length; j++) {
      final act = activities[j];
      final activity = db.collection('activities').doc();

      final map = <String, dynamic>{
        'userId': userId,
      }..addAll(act.toJson());

      batch.set(
        activity,
        map,
      );

      catMap[act.categoryId] = (catMap[act.categoryId] ?? 0) + act.duration;

      if (0 == j % 500) {
        batch.commit();
        batch = db.batch();
      }
    }

    await batch.commit();

    //Update categories

    final batchCat = db.batch();
    for (final category in categories) {
      for (final sub in category.subCategories) {
        if (catMap.keys.contains(sub.id)) {
          catMap[category.id] = (catMap[category.id] ?? 0) + catMap[sub.id]!;
        }
      }
    }

    for (final key in catMap.keys) {
      final document = db.collection('categories').doc(key);

      batchCat.update(
        document,
        {
          'allDuration': catMap[key]!,
        },
      );
    }

    await batchCat.commit();
  }
}
