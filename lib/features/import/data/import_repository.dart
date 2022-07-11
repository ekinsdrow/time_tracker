import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';

abstract class IImportRepository {
  Future<void> save({
    required List<Activity> activities,
  });
}

class ImportRepository implements IImportRepository {
  @override
  Future<void> save({
    required List<Activity> activities,
  }) async {
    final db = FirebaseFirestore.instance;
    final batch = db.batch();

    for (final act in activities) {
      final activity = db.collection('activities').doc();

      batch.set(
        activity,
        act.toJson(),
      );

      final category = db.collection('categories').doc(act.categoryId);

      log(category.toString());
    }

    // return await batch.commit();
  }
}
