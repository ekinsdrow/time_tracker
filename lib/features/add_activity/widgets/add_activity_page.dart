import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/features/categories/data/models/categories.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({Key? key}) : super(key: key);

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  var _categoryDropDownIndex = 0;
  var _subCategoryDropDownIndex = -1;

  void _save() {}

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<Categories>().categories;

    return Scaffold(
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
                  Container(
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
                    child: const Text(
                      '00:00:00',
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _save,
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
