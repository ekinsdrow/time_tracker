import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/widgets/activity_item.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';

class ImportPage extends StatefulWidget {
  const ImportPage({Key? key}) : super(key: key);

  @override
  State<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> {
  final _activities = <Activity>[];

  Future<void> _open() async {
    _activities.clear();
    final jsonFileString = await rootBundle.loadString('assets/json/file.json');
    final json = jsonDecode(jsonFileString);

    for (final activity in json) {
      _activities.add(
        Activity(
          categoryId: activity['categoryId'],
          duration: int.parse(activity['duration']),
          endTimestamp: DateTime.now(),
        ),
      );
    }

    setState(() {});
  }

  void _save() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: _open,
                  child: const Text('Open'),
                ),
                const SizedBox(
                  width: Constants.smallPadding,
                ),
                ElevatedButton(
                  onPressed: _activities.isNotEmpty ? _save : null,
                  child: const Text('Save'),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(
                  height: Constants.smallPadding,
                ),
                itemBuilder: (context, index) => ActivityItem(
                  activity: _activities[index],
                ),
                itemCount: _activities.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
