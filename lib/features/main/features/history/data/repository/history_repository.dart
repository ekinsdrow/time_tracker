import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/features/main/features/history/data/models/activity.dart';

abstract class IHistoryRepository {
  Stream<List<Activity>> getActivities({
    required String userId,
  });
}

class HistoryRepository implements IHistoryRepository {
  @override
  Stream<List<Activity>> getActivities({required String userId}) {
    final snapshot = FirebaseFirestore.instance
        .collection('activities')
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
