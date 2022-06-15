import 'package:flutter/material.dart';

void showError({
  required BuildContext context,
  required String error,
}) {
  showAboutDialog(
    context: context,
    children: [
      Text(error),
    ],
  );
}

class _ErrorDialog extends StatelessWidget {
  const _ErrorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
