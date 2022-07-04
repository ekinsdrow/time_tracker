import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/extensions/date_time.dart';
import 'package:time_tracker/features/add_activity/bloc/add_activity_bloc.dart';
import 'package:time_tracker/features/add_activity/data/models/time.dart';
import 'package:time_tracker/features/add_activity/di/add_activity_scope.dart';
import 'package:time_tracker/features/add_activity/widgets/pick_time.dart';
import 'package:time_tracker/features/categories/data/models/categories.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';
import 'package:time_tracker/features/user/data/models/user.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({Key? key}) : super(key: key);

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  var _categoryDropDownIndex = 0;
  var _subCategoryDropDownIndex = -1;

  var _time = Time.zero();
  var _date = DateTime.now();

  void _save(
    BuildContext context,
  ) {
    final categories = context.read<Categories>().categories;
    context.read<AddActivityBloc>().add(
          AddActivityEvent.save(
            time: _time,
            dateTime: _date,
            userId: context.read<UserModel>().uid,
            mainCategoryLeaf: categories[_categoryDropDownIndex],
            subCategoryLeaf: _subCategoryDropDownIndex == -1
                ? null
                : categories[_categoryDropDownIndex]
                    .subCategories[_subCategoryDropDownIndex],
          ),
        );
  }

  Future<void> _chooseTime() async {
    final pick = await openTimePciker(
      context: context,
      time: _time,
    );

    if (pick != null) {
      setState(() {
        _time = pick;
      });
    }
  }

  Future<void> _chooseDate() async {
    final ctx = context;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (context, child) => Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Theme.of(ctx).primaryColor,
            onPrimary: Theme.of(ctx).scaffoldBackgroundColor,
            onSurface: Theme.of(ctx).textTheme.bodyText2!.color!,
          ),
        ),
        child: child!,
      ),
    );

    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<Categories>().categories;

    return AddActivityScope(
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(
              Constants.mediumPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).hintColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          Constants.smallPadding,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.smallPadding,
                      ),
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: _categoryDropDownIndex,
                          isExpanded: true,
                          items: [
                            for (var i = 0; i < categories.length; i++)
                              DropdownMenuItem(
                                child: Text(
                                  categories[i].name,
                                ),
                                value: i,
                              ),
                          ],
                          onChanged: (v) {
                            setState(() {
                              if (v != null) {
                                _categoryDropDownIndex = v;
                                _subCategoryDropDownIndex = -1;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Constants.mediumPadding,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).hintColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          Constants.smallPadding,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.smallPadding,
                      ),
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: _subCategoryDropDownIndex,
                          isExpanded: true,
                          items: [
                            const DropdownMenuItem(
                              child: Text(
                                'All categories',
                              ),
                              value: -1,
                            ),
                            if (_categoryDropDownIndex != -1)
                              for (var i = 0;
                                  i <
                                      categories[_categoryDropDownIndex]
                                          .subCategories
                                          .length;
                                  i++)
                                DropdownMenuItem(
                                  child: Text(
                                    categories[_categoryDropDownIndex]
                                        .subCategories[i]
                                        .name,
                                  ),
                                  value: i,
                                ),
                          ],
                          onChanged: (v) {
                            setState(() {
                              if (v != null) {
                                _subCategoryDropDownIndex = v;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Constants.mediumPadding,
                    ),
                    InkWell(
                      onTap: _chooseTime,
                      borderRadius: BorderRadius.circular(
                        Constants.smallPadding,
                      ),
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(Constants.smallPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Theme.of(context).hintColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            Constants.smallPadding,
                          ),
                        ),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _time.format,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Constants.mediumPadding,
                    ),
                    InkWell(
                      onTap: _chooseDate,
                      borderRadius: BorderRadius.circular(
                        Constants.smallPadding,
                      ),
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(Constants.smallPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Theme.of(context).hintColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            Constants.smallPadding,
                          ),
                        ),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _date.formatDate,
                        ),
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: BlocBuilder<AddActivityBloc, AddActivityState>(
                        builder: (context, state) {
                          if (state == const AddActivityState.loading()) {
                            return Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              child: const CircularProgressIndicator(),
                            );
                          }

                          return ElevatedButton(
                            onPressed: () {
                              _save(context);
                            },
                            child: const Text('Save'),
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
