import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';

class CategoryFilterPage extends StatefulWidget {
  const CategoryFilterPage({Key? key}) : super(key: key);

  @override
  State<CategoryFilterPage> createState() => _CategoryFilterPageState();
}

class _CategoryFilterPageState extends State<CategoryFilterPage> {
  int _categoryDropDownIndex = 0;
  int _subCategoryDropDownIndex = 0;

  void _save() {}

  @override
  Widget build(BuildContext context) {
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
                        for (var i = 0; i < 10; i++)
                          DropdownMenuItem(
                            child: Text('Music $i'),
                            value: i,
                          ),
                      ],
                      onChanged: (v) {
                        setState(() {
                          if (v != null) {
                            _categoryDropDownIndex = v;
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
                        for (var i = 0; i < 10; i++)
                          DropdownMenuItem(
                            child: Text('Music $i'),
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
