import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData dynamicLightTheme(ColorScheme? lightDynamic) {
  if (lightDynamic == null) {
    return ThemeData(useMaterial3: true);
  }
  return ThemeData(
    useMaterial3: true,
    backgroundColor: lightDynamic.surface,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent),
      backgroundColor: lightDynamic.onInverseSurface,
      actionsIconTheme: IconThemeData(color: lightDynamic.onPrimaryContainer),
      centerTitle: false,
      titleTextStyle:
          TextStyle(fontSize: 18, color: lightDynamic.inverseSurface),
    ),
  );
}

ThemeData lightTheme() {
  return ThemeData(
      useMaterial3: true,
      backgroundColor: const Color(0xFFFFFBFF),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Color(0xffF8EFE9),
        ),
        actionsIconTheme: IconThemeData(color: Color(0xff2A1700)),
      ),
      bottomAppBarColor: const Color.fromARGB(140, 255, 221, 184),
      primaryColor: const Color(0xff83540D),
      secondaryHeaderColor: const Color(0xff6D5B47));
}
