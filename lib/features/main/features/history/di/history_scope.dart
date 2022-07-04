import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/dialogs/error_dialog.dart';
import 'package:time_tracker/features/main/features/history/bloc/history_bloc.dart';
import 'package:time_tracker/features/main/features/history/data/repository/history_repository.dart';

class HistoryScope extends StatelessWidget {
  const HistoryScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IHistoryRepository>(
      create: (context) => HistoryRepository(),
      child: BlocProvider(
        create: (context) => HistoryBloc(
          historyRepository: context.read<IHistoryRepository>(),
        ),
        child: BlocListener<HistoryBloc, HistoryState>(
          listener: (context, state) => state.whenOrNull(
            error: (error) => showError(context: context, error: error),
          ),
          child: child,
        ),
      ),
    );
  }
}
