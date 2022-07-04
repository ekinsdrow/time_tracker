import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/extensions/int.dart';
import 'package:time_tracker/features/add_activity/data/models/time.dart';

Future<Time?> openTimePciker({
  required Time time,
  required BuildContext context,
}) async {
  return await showModalBottomSheet(
    context: context,
    builder: (context) => _TimePicker(
      time: time,
    ),
  );
}

class _TimePicker extends StatefulWidget {
  const _TimePicker({
    Key? key,
    required this.time,
  }) : super(key: key);

  final Time time;

  @override
  State<_TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<_TimePicker> {
  late Time _time;

  void _save() {
    Navigator.of(context).pop(
      _time,
    );
  }

  @override
  void initState() {
    super.initState();
    _time = widget.time;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      padding: const EdgeInsets.all(
        Constants.mediumPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Pick(
                value: _time.hours,
                text: 'hours',
                callback: (value) {
                  setState(() {
                    _time = _time.copyWith(
                      hours: value,
                    );
                  });
                },
              ),
              const SizedBox(
                width: Constants.smallPadding,
              ),
              _Pick(
                value: _time.minutes,
                text: 'mins',
                callback: (value) {
                  setState(() {
                    _time = _time.copyWith(
                      minutes: value,
                    );
                  });
                },
              ),
              const SizedBox(
                width: Constants.smallPadding,
              ),
              _Pick(
                value: _time.seconds,
                text: 'secs',
                callback: (value) {
                  setState(() {
                    _time = _time.copyWith(
                      seconds: value,
                    );
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: Constants.smallPadding,
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
    );
  }
}

class _Pick extends StatelessWidget {
  const _Pick({
    required this.callback,
    required this.text,
    required this.value,
    Key? key,
  }) : super(key: key);

  final int value;
  final String text;
  final Function(int value) callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            callback(value + 1);
          },
          icon: const Icon(
            Icons.add,
          ),
          splashRadius: 20,
        ),
        const SizedBox(
          height: Constants.smallPadding,
        ),
        Text(
          value.addZero,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          text,
        ),
        const SizedBox(
          height: Constants.smallPadding,
        ),
        IconButton(
          onPressed: () {
            final val = value - 1;
            callback(val < 0 ? 0 : val);
          },
          icon: const Icon(
            Icons.remove,
          ),
          splashRadius: 20,
        ),
      ],
    );
  }
}
