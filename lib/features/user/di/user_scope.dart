import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/features/app/router/router.dart';
import 'package:time_tracker/features/categories/bloc/categories_bloc.dart';
import 'package:time_tracker/features/categories/di/categories_scope.dart';
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
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) => state.when(
          login: (_) => router.replaceAll(
            [
              const MainRoute(),
            ],
          ),
          logout: () => router.replaceAll([const LoginRoute()]),
        ),
        builder: (context, state) => state.when(
          login: (user) {
            log(user.toString());
            return CategoriesScope(
              userModel: user,
              child: Provider.value(
                value: user,
                child: child,
              ),
            );
          },
          logout: () => child,
        ),
      ),
    );
  }
}
