import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme(ColorScheme? lightDynamic) {
  if (lightDynamic == null) {
    return ThemeData(useMaterial3: true);
  }
  return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent),
          backgroundColor: lightDynamic.onInverseSurface,
          actionsIconTheme:
              IconThemeData(color: lightDynamic.onPrimaryContainer),
          centerTitle: false,
          titleTextStyle:
              TextStyle(fontSize: 18, color: lightDynamic.inverseSurface)));
}
