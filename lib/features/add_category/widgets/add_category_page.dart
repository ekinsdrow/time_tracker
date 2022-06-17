import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({Key? key}) : super(key: key);

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final _controller = TextEditingController();
  int _dropDownIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _save() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.mediumPadding,
        ),
        child: Column(
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
                    for (var i = 0; i < 10; i++)
                      DropdownMenuItem(
                        child: Text('Music $i'),
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
            SizedBox(
              width: double.infinity,
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
