import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/features/categories/data/models/categories.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';

class CategoryFilterPage extends StatefulWidget {
  const CategoryFilterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryFilterPage> createState() => _CategoryFilterPageState();
}

class _CategoryFilterPageState extends State<CategoryFilterPage> {
  //-1 = all categories
  int _categoryDropDownIndex = -1;
  int _subCategoryDropDownIndex = -1;

  void _save() {}

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<Categories>().categories;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.mediumPadding,
          vertical: Constants.mediumPadding,
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
                        const DropdownMenuItem(
                          child: Text(
                            'All categories',
                          ),
                          value: -1,
                        ),
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
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _save,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
