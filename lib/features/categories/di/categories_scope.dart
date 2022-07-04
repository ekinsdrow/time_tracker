import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/dialogs/error_dialog.dart';
import 'package:time_tracker/features/categories/bloc/categories_bloc.dart';
import 'package:time_tracker/features/categories/data/models/categories.dart';
import 'package:time_tracker/features/categories/data/repositories/categories_repository.dart';
import 'package:time_tracker/features/user/data/models/user.dart';

class CategoriesScope extends StatelessWidget {
  const CategoriesScope({
    Key? key,
    required this.child,
    required this.userModel,
  }) : super(key: key);

  final Widget child;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Provider<ICategoriesRepository>(
      create: (context) => CategoriesRepository(),
      child: BlocProvider(
        create: (context) => CategoriesBloc(
          categoriesRepository: context.read<ICategoriesRepository>(),
        )..add(
            CategoriesEvent.fetch(
              userId: userModel.uid,
            ),
          ),
        lazy: false,
        child: BlocConsumer<CategoriesBloc, CategoriesState>(
          listener: (context, state) => state.whenOrNull(
            error: (error) => showError(
              context: context,
              error: error,
            ),
          ),
          builder: (context, state) => state.when(
            error: (error) => Container(),
            loading: () => Container(
              color: Colors.white,
              child: Container(
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
            ),
            success: (categories) => Provider<Categories>(
              create: (context) => categories,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
