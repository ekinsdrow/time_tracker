import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/features/user/data/models/user.dart';

class MainScope extends StatelessWidget {
  const MainScope({
    required this.child,
    required this.user,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: user,
      child: child,
    );
  }
}
