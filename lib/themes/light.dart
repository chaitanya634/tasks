import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData dynamicLightTheme(ColorScheme lightDynamic) => ThemeData(
      useMaterial3: true,
      colorScheme: lightDynamic,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
    );

ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        surfaceTint: Color(0xFF83540D),
        onErrorContainer: Color(0xFF410002),
        onError: Color(0xFFFFFFFF),
        errorContainer: Color(0xFFFFDAD6),
        onTertiaryContainer: Color(0xFF151E07),
        tertiaryContainer: Color(0xFFDAE8C2),
        tertiary: Color(0xFF576245),
        shadow: Color(0xFF000000),
        error: Color(0xFFBA1A1A),
        onBackground: Color(0xFF1F1B17),
        background: Color(0xFFFFFBFF),
        onInverseSurface: Color(0xFFF8EFE9),
        inverseSurface: Color(0xFF34302C),
        onSurfaceVariant: Color(0xFF4E453C),
        onSurface: Color(0xFF1F1B17),
        surfaceVariant: Color(0xFFEEE0D4),
        surface: Color(0xFFFFFBFF),
        onSecondaryContainer: Color(0xFF2A1700),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFF7DEC5),
        secondary: Color(0xFF6D5B47),
        inversePrimary: Color(0xFFF9BB6C),
        onPrimaryContainer: Color(0xFF2A1700),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFFFDDB8),
        primary: Color(0xFF83540D),
      ),
    );
