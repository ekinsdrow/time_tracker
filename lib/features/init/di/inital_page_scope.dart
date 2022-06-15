import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/features/init/blocs/init/initial_bloc.dart';

class InitialPageScope extends StatelessWidget {
  const InitialPageScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitialBloc()
        ..add(
          const InitialEvent.started(),
        ),
      child: child,
    );
  }
}
