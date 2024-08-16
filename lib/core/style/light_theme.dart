import 'package:flutter/material.dart';

import 'colors.dart';


final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    brightness: Brightness.light,
    primaryColor: KColors.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: KColors.primaryColor,
    ),

    // progressIndicatorTheme: const ProgressIndicatorThemeData(color: KColors.primaryColor),
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: KColors.primaryColor,
    //   foregroundColor: KColors.secondaryColor,
    // ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: KColors.primaryColor),
        iconColor: KColors.secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: KColors.secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: KColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ))
);
