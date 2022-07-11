import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/widgets/activity_item.dart';
import 'package:time_tracker/features/activity/data/models/activity.dart';
import 'package:time_tracker/features/import/bloc/import_bloc.dart';
import 'package:time_tracker/features/main/di/import_scope.dart';

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
      final date = activity['date'].toString();
      _activities.add(
        Activity(
          categoryId: activity['categoryId'],
          duration: int.parse(activity['duration']),
          endTimestamp: DateTime(
            int.parse(date.substring(0, 4)),
            int.parse(date.substring(5, 7)),
            int.parse(date.substring(8)),
          ),
        ),
      );
    }

    setState(() {});
  }

  void _save(
    BuildContext context,
  ) {
    context.read<ImportBloc>().add(
          ImportEvent.save(activities: _activities),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ImportScope(
      child: Scaffold(
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
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: _activities.isNotEmpty
                            ? () {
                                _save(context);
                              }
                            : null,
                        child: const Text('Save'),
                      );
                    },
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
              BlocBuilder<ImportBloc, ImportState>(
                builder: (context, state) {
                  return Text(
                    state.when(
                      initial: () => 'Initial',
                      loading: () => 'Loading',
                      success: () => 'Success',
                      error: (e) => 'Error: $e',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
