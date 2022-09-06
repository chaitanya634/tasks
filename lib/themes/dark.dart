import 'package:flutter/material.dart';

ThemeData darkTheme() => ThemeData.dark();

ThemeData dynamicDarkTheme(ColorScheme darkDynamic) => ThemeData(
  useMaterial3: true,
  colorScheme: darkDynamic,
);
