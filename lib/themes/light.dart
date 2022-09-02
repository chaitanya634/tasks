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
          statusBarIconBrightness: Brightness.dark,
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
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color(0xffF8EFE9),
      ),
      actionsIconTheme: IconThemeData(color: Color(0xff2A1700)),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: Color(0xFFFFFBFF),
      onBackground: Color(0xff1F1B17),
      surface: Color.fromARGB(140, 255, 221, 184),
      onSurface: Color(0xff2A1700),
      inverseSurface: Color(0xff34302C),
      primary: Color(0xff83540D),
      onPrimary: Color(0xffFFFFFF),
      secondary: Color(0xff6D5B47),
      onSecondary: Color(0xffFFFFFF),
      error: Color(0xffBA1A1A),
      onError: Color(0xffFFFFFF),
      outline: Color(0xff80756B)
    ),
  );
}
