import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme(ColorScheme? lightDynamic) {
  if (lightDynamic == null) {
    return ThemeData(useMaterial3: true);
  }
  return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: lightDynamic.onInverseSurface),
        backgroundColor: lightDynamic.onInverseSurface,
        actionsIconTheme: IconThemeData(color: lightDynamic.onPrimaryContainer),
        centerTitle: false,
      ));
}
