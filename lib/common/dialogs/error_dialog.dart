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