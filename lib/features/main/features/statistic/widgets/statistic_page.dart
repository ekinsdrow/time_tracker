import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/extensions/string.dart';

enum StatisticTypes {
  day,
  week,
  month,
  year,
  custom,
}

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  var _type = StatisticTypes.day;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Type(
          type: _type,
          callback: (type) {
            setState(() {
              _type = type;
            });
          },
        ),
      ],
    );
  }
}

class _Type extends StatelessWidget {
  const _Type({
    required this.type,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final StatisticTypes type;
  final Function(StatisticTypes type) callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final borderRadius = index == 0
              ? const BorderRadius.only(
                  topLeft: Radius.circular(
                    Constants.smallPadding,
                  ),
                  bottomLeft: Radius.circular(
                    Constants.smallPadding,
                  ),
                )
              : (index == StatisticTypes.values.length - 1
                  ? const BorderRadius.only(
                      topRight: Radius.circular(
                        Constants.smallPadding,
                      ),
                      bottomRight: Radius.circular(
                        Constants.smallPadding,
                      ),
                    )
                  : BorderRadius.zero);

          return InkWell(
            onTap: () {
              callback(
                StatisticTypes.values[index],
              );
            },
            borderRadius: borderRadius,
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.mediumPadding,
              ),
              decoration: BoxDecoration(
                color: type == StatisticTypes.values[index]
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withAlpha(100),
                borderRadius: borderRadius,
              ),
              alignment: Alignment.center,
              child: Text(
                StatisticTypes.values[index].name.capitalize,
                style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
          );
        },
        itemCount: StatisticTypes.values.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
