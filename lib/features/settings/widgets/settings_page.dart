import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/assets/constants.dart';
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
                  InkWell(
                    onTap: () {
                      context.read<SettingsBloc>().add(
                            const SettingsEvent.logout(),
                          );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(
                        Constants.mediumPadding,
                      ),
                      width: double.infinity,
                      child: const Text(
                        'Log out',
                      ),
                    ),
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
