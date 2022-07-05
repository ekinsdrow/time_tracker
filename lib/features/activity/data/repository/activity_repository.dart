import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';

abstract class IActivityRepository {
  Stream<List<Activity>> getActivities({
    required String userId,
  });
}

class ActivityRepository implements IActivityRepository {
  @override
  Stream<List<Activity>> getActivities({required String userId}) {
    final snapshot = FirebaseFirestore.instance
        .collection('activities')
        .orderBy(
          'endTimestamp',
          descending: true,
        )
        .where(
          'userId',
          isEqualTo: userId,
        )
        .snapshots();

    return snapshot.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          final activities = <Activity>[];
          for (final activity in data.docs) {
            final data = activity.data();
            data['id'] = activity.id;

            activities.add(
              Activity.fromJson(data),
            );
          }

          sink.add(activities);
        },
      ),
    );
  }
}
