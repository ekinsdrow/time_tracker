import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/dialogs/error_dialog.dart';
import 'package:time_tracker/features/settings/bloc/settings_bloc.dart';

class SettingsScope extends StatelessWidget {
  const SettingsScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) => state.whenOrNull(
          error: (error) => showError(context: context, error: error),
        ),
        builder: (context, state) => state.when(
          initial: () => child,
          loading: () => Stack(
            children: [
              child,
              Container(
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(
                      Constants.smallPadding,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const CircularProgressIndicator(),
                  ),
                ),
              )
            ],
          ),
          error: (_) => child,
        ),
      ),
    );
  }
}
