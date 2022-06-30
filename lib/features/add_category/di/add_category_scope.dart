import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/dialogs/error_dialog.dart';
import 'package:time_tracker/features/add_category/bloc/add_category_bloc.dart';
import 'package:time_tracker/features/add_category/data/repositories/add_category_repository.dart';
import 'package:time_tracker/features/categories/bloc/categories_bloc.dart';
import 'package:time_tracker/features/user/data/models/user.dart';

class AddCategoryScope extends StatelessWidget {
  const AddCategoryScope({
    required this.child,
    required this.user,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IAddRepository>(
      create: (context) => AddRepository(),
      child: BlocProvider(
        create: (context) => AddCategoryBloc(
          addRepository: context.read<IAddRepository>(),
        ),
        child: BlocListener<AddCategoryBloc, AddCategoryState>(
          listener: (context, state) => state.whenOrNull(
            error: (error) => showError(context: context, error: error),
            success: (id) => context.read<CategoriesBloc>().add(
                  CategoriesEvent.fetch(
                    userId: user.uid,
                  ),
                ),
          ),
          child: child,
        ),
      ),
    );
  }
}
