import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/features/add_activity/bloc/add_activity_bloc.dart';
import 'package:time_tracker/features/add_activity/data/repository/add_activity_repository.dart';

class AddActivityScope extends StatelessWidget {
  const AddActivityScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IAddActivityRepository>(
      create: (context) => AddActivityRepository(),
      child: BlocProvider(
        create: (context) => AddActivityBloc(
          activityRepository: context.read<IAddActivityRepository>(),
        ),
        child: child,
      ),
    );
  }
}
