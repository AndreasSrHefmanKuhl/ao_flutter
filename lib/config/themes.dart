import 'package:flutter/material.dart';

import 'sizes.dart';
import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  buttonTheme: const ButtonThemeData(
    buttonColor: borderWhite,
    height: btnHeight,
    minWidth: btnWidth,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: defaultTextSize),
    headlineLarge: TextStyle(fontSize: headlineTextSize),
  ),
);
