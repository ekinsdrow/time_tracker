import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/features/app/router/router.dart';
import 'package:time_tracker/features/user/bloc/user_cubit.dart';

class UserScope extends StatelessWidget {
  const UserScope({
    required this.child,
    required this.router,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocListener<UserCubit, UserState>(
        listener: (context, state) => state.when(
          login: (user) => router.replaceAll([const MainRoute()]),
          logout: () => router.replaceAll([const LoginRoute()]),
        ),
        child: child,
      ),
    );
  }
}
