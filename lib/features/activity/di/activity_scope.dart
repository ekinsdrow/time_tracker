import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/dialogs/error_dialog.dart';
import 'package:time_tracker/features/activity/cubit/actvity_cubit.dart';
import 'package:time_tracker/features/activity/data/repository/activity_repository.dart';
import 'package:time_tracker/features/user/data/models/user.dart';

class ActvityScope extends StatelessWidget {
  const ActvityScope({
    required this.child,
    required this.user,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IActivityRepository>(
      create: (context) => ActivityRepository(),
      child: BlocProvider(
        create: (context) => ActivityCubit(
          activityRepository: context.read<IActivityRepository>(),
          userId: user.uid,
        ),
        child: BlocConsumer<ActivityCubit, ActivityState>(
          listener: (context, state) => state.whenOrNull(
            error: (error) => showError(context: context, error: error),
          ),
          builder: (context, state) => state.when(
            loading: () => Container(
              color: Colors.black38,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(
                    Constants.smallPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
            error: (error) => Container(),
            success: (activities) => Provider.value(
              value: activities,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
