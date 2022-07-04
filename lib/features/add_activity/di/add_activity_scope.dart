import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/dialogs/error_dialog.dart';
import 'package:time_tracker/features/add_activity/bloc/add_activity_bloc.dart';
import 'package:time_tracker/features/add_activity/data/repository/add_activity_repository.dart';
import 'package:time_tracker/features/categories/bloc/categories_bloc.dart';
import 'package:time_tracker/features/user/data/models/user.dart';

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
        child: BlocListener<AddActivityBloc, AddActivityState>(
          listener: (context, state) => state.whenOrNull(
            error: (error) => showError(context: context, error: error),
            success: () => context.read<CategoriesBloc>().add(
                  CategoriesEvent.fetch(
                    userId: context.read<UserModel>().uid,
                  ),
                ),
          ),
          child: child,
        ),
      ),
    );
  }
}
