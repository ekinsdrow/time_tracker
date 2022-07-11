import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/features/import/bloc/import_bloc.dart';
import 'package:time_tracker/features/import/data/import_repository.dart';

class ImportScope extends StatelessWidget {
  const ImportScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IImportRepository>(
      create: (context) => ImportRepository(),
      child: BlocProvider(
        create: (context) => ImportBloc(
          importRepository: context.read<IImportRepository>(),
        ),
        child: child,
      ),
    );
  }
}
