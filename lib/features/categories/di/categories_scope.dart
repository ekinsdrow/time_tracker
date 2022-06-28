import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/features/categories/bloc/categories_bloc.dart';
import 'package:time_tracker/features/categories/data/repositories/categories_repository.dart';

class CategoriesScope extends StatelessWidget {
  const CategoriesScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Provider<ICategoriesRepository>(
      create: (context) => CategoriesRepository(),
      child: BlocProvider(
        create: (context) => CategoriesBloc(
          categoriesRepository: context.read<ICategoriesRepository>(),
        )..add(const CategoriesEvent.fetch()),
        lazy: false,
        child: BlocListener<CategoriesBloc, CategoriesState>(
          listener: (context, state) => state.whenOrNull(),
          child: child,
        ),
      ),
    );
  }
}
