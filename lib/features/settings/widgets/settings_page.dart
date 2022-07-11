import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/features/app/router/router.dart';
import 'package:time_tracker/features/settings/bloc/settings_bloc.dart';
import 'package:time_tracker/features/settings/di/settings_scope.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsScope(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Column(
                children: [
                  _Item(
                    callback: () {
                      context.read<SettingsBloc>().add(
                            const SettingsEvent.logout(),
                          );
                    },
                    text: 'Log out',
                  ),
                  if (!kReleaseMode)
                    _Item(
                      callback: () {
                        context.router.push(
                          const ImportRoute(),
                        );
                      },
                      text: 'Open import screen',
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.callback,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        width: double.infinity,
        child: Text(
          text,
        ),
      ),
    );
  }
}
