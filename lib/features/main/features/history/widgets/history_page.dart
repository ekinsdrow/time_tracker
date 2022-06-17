import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/extensions/date_time.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime? _chooseDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Header(),
        const SizedBox(
          height: Constants.mediumPadding,
        ),
        _Filters(
          date: _chooseDate,
          dateCallback: (d) {
            setState(() {
              _chooseDate = d;
            });
          },
        ),
        const SizedBox(
          height: Constants.mediumPadding,
        ),
        const Expanded(
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
  const _Filters({
    Key? key,
    required this.date,
    required this.dateCallback,
  }) : super(key: key);

  final DateTime? date;
  final Function(DateTime?) dateCallback;

  void _openDateFilter(BuildContext context) async {
    final ctx = context;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
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

    dateCallback(pickedDate);
  }

  void _clearDate() {
    dateCallback(null);
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                date != null ? date!.formatDate : 'Date',
              ),
              if (date != null)
                Row(
                  children: [
                    const SizedBox(
                      width: Constants.smallPadding / 2,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: _clearDate,
                      child: const Icon(
                        Icons.clear,
                        size: 18,
                      ),
                    ),
                  ],
                ),
            ],
          ),
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
        child: ListTile(
          title: Text(
            'Музыка / Гитара - 00:50:20',
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          subtitle: Text(
            DateTime.now().formatDate,
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
