import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/dialogs/error_dialog.dart';
import 'package:time_tracker/features/categories/bloc/categories_bloc.dart';
import 'package:time_tracker/features/categories/data/models/category.dart';
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
        child: BlocConsumer<CategoriesBloc, CategoriesState>(
          listener: (context, state) => state.whenOrNull(
            error: (error) => showError(
              context: context,
              error: error,
            ),
          ),
          builder: (context, state) => state.when(
            error: (error) => child,
            loading: () => Stack(
              children: [
                child,
                Container(
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
                )
              ],
            ),
            success: (categories) => Provider<List<Category>>(
              create: (context) => categories,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
