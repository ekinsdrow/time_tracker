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
      itemBuilder: (context, index) => const _Category(),
      separatorBuilder: (_, __) => const SizedBox(
        height: Constants.smallPadding,
      ),
      itemCount: 3,
    );
  }
}

class _Category extends StatelessWidget {
  const _Category({Key? key}) : super(key: key);

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
              Text(
                'Music',
                style: Theme.of(context).textTheme.headline2,
              ),
              const Text('30:00:00'),
            ],
          ),
        ],
      ),
    );
  }
}
