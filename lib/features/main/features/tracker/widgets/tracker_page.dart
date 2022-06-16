import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _Header(),
        SizedBox(
          height: Constants.mediumPadding,
        ),
        Expanded(
          child: _Categories(),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Time Tracker',
          style: Theme.of(context).textTheme.headline1,
        ),
        IconButton(
          onPressed: () {
            //TODO: open settings
          },
          splashRadius: 20,
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 3) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.mediumPadding - 5,
              vertical: Constants.mediumPadding,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: BorderRadius.circular(
                Constants.smallPadding,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add),
                  const SizedBox(
                    width: Constants.smallPadding,
                  ),
                  Text(
                    'Add category',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          );
        }

        return const _Category();
      },
      separatorBuilder: (_, __) => const SizedBox(
        height: Constants.mediumPadding,
      ),
      itemCount: 4,
    );
  }
}

class _Category extends StatefulWidget {
  const _Category({Key? key}) : super(key: key);

  @override
  State<_Category> createState() => _CategoryState();
}

class _CategoryState extends State<_Category> {
  bool _isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.mediumPadding - 5,
        vertical: Constants.mediumPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.circular(
          Constants.smallPadding,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isOpen = !_isOpen;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Text(
                        'Music',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        width: Constants.smallPadding,
                      ),
                      RotatedBox(
                        quarterTurns: _isOpen ? 2 : 0,
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text('30:00:00'),
            ],
          ),
          if (_isOpen)
            Column(
              children: const [
                SizedBox(
                  height: Constants.mediumPadding,
                ),
                _SubCategories(),
                SizedBox(
                  height: Constants.mediumPadding,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _SubCategories extends StatelessWidget {
  const _SubCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Constants.smallPadding,
      runSpacing: Constants.smallPadding,
      children: [
        for (int i = 0; i < 10; i++)
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 -
                Constants.mediumPadding * 2,
            child: const _SubCategory(),
          ),
        Container(
          width: MediaQuery.of(context).size.width / 2 -
              Constants.mediumPadding * 2,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(Constants.smallPadding),
          ),
          padding: const EdgeInsets.all(Constants.smallPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Add category'),
              Icon(
                Icons.add,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SubCategory extends StatelessWidget {
  const _SubCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(Constants.smallPadding),
      ),
      padding: const EdgeInsets.all(Constants.smallPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Guitar',
          ),
          Row(
            children: const [
              Icon(Icons.play_arrow),
              SizedBox(
                width: Constants.smallPadding / 2,
              ),
              Text('30:00:00'),
            ],
          ),
        ],
      ),
    );
  }
}
