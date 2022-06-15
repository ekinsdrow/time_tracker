import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';

abstract class Themes {
  static get lightTheme => ThemeData.light().copyWith(
        primaryColor: AppColors._primary,
        appBarTheme: AppBarTheme(
          color: AppColors._primary,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: _inputBorder,
          focusedBorder: _inputBorder,
          enabledBorder: _inputBorder,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: AppColors._primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Constants.smallPadding,
              ),
            ),
          ),
        ),
      );

  static get _inputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Constants.smallPadding,
        ),
        borderSide: BorderSide(
          color: AppColors._grey!,
          width: 1,
        ),
      );
}

abstract class AppColors {
  static final Color? _primary = Colors.blue[300];
  static final Color? _grey = Colors.grey[300];
}
