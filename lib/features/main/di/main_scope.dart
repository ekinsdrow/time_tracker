import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/features/user/data/models/user.dart';

class MainScope extends StatelessWidget {
  const MainScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: context.read<UserModel>(),
      child: child,
    );
  }
}
