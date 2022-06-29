import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/features/categories/data/models/categories.dart';
import 'package:time_tracker/features/categories/data/models/category_leaf.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({
    required this.categories,
    Key? key,
  }) : super(key: key);

  final Categories categories;

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final _controller = TextEditingController();
  
  //-1 = root category
  int _dropDownIndex = -1;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _save() {}

  @override
  Widget build(BuildContext context) {
    final categories = widget.categories.categories;

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
                      value: _dropDownIndex,
                      isExpanded: true,
                      items: [
                        const DropdownMenuItem(
                          child: Text(
                            'Root Category',
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
                            _dropDownIndex = v;
                          }
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: Constants.mediumPadding,
                ),
                TextField(
                  controller: _controller,
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
