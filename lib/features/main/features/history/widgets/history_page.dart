import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _Header(),
        SizedBox(
          height: Constants.mediumPadding,
        ),
        _Filters(),
        SizedBox(
          height: Constants.mediumPadding,
        ),
        Expanded(
          child: _HistoryList(),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'History',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class _Filters extends StatelessWidget {
  const _Filters({Key? key}) : super(key: key);

  void _openDateFilter(BuildContext context) {
    //TODO: open date filter
  }
  void _openCategory(BuildContext context) {
    //TODO: open category filter
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            _openDateFilter(context);
          },
          child: const Text('Date'),
        ),
        const SizedBox(
          width: Constants.smallPadding,
        ),
        ElevatedButton(
          onPressed: () {
            _openCategory(context);
          },
          child: const Text('Category'),
        ),
      ],
    );
  }
}

class _HistoryList extends StatelessWidget {
  const _HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            Constants.smallPadding,
          ),
        ),
        child:  ListTile(
          title: Text(
            'Музыка / Гитара - 00:50:20',
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          subtitle: Text(
            '20.05.2020',
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ),
      separatorBuilder: (_, __) => const SizedBox(
        height: Constants.smallPadding,
      ),
      itemCount: 100,
    );
  }
}
