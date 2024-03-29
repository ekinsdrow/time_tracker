import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';

abstract class Themes {
  static get lightTheme => ThemeData(
        brightness: Brightness.light,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors._primary,
        ),
        fontFamily: 'Montserrat',
        primaryColor: AppColors._primary,
        appBarTheme: const AppBarTheme(
          color: AppColors._bg,
          iconTheme: IconThemeData(
            color: AppColors._primary,
          ),
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
        scaffoldBackgroundColor: AppColors._bg,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: AppColors._bg,
          selectedIconTheme: IconThemeData(
            color: AppColors._primary,
          ),
          unselectedIconTheme: IconThemeData(
            color: AppColors._black,
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            color: AppColors._black,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 16,
            color: AppColors._black,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: AppColors._black,
          ),
        ),
        hintColor: AppColors._grey,
      );

  static get _inputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Constants.smallPadding,
        ),
        borderSide: const BorderSide(
          color: AppColors._grey,
          width: 1,
        ),
      );
}

abstract class AppColors {
  static const Color _primary = Color(0xFF5C6BC0);
  static const Color _bg = Color(0xFFFFFFFF);
  static const Color _black = Color(0xFF000000);
  static const Color _grey = Color(0xFFF5F4F7);
}
