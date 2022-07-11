import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/extensions/date_time.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';
import 'package:time_tracker/features/app/data/models/time.dart';
import 'package:time_tracker/features/categories/data/models/categories.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({
    required this.activity,
    Key? key,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final categories = context.read<Categories>();
    final categoryStr = categories.categoriesName(
      activity.categoryId,
    );
    
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.circular(
          Constants.smallPadding,
        ),
      ),
      child: ListTile(
        title: Text(
          '$categoryStr - ${Time.fromDuration(duration: activity.duration).format}',
        ),
        subtitle: Text(
          activity.endTimestamp.formatDate,
        ),
      ),
    );
  }
}
