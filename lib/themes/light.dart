import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      colorScheme: ColorScheme(
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
        background: Color(0xFFf0f0f0),
        onInverseSurface: Color(0xFFF8EFE9),
        inverseSurface: Color(0xFF34302C),
        onSurfaceVariant: Color(0xFF4E453C),
        onSurface: Color(0xFF1F1B17),
        surfaceVariant: Color(0xFFEEE0D4),
        surface: Color(0xFFfafafa),
        onSecondaryContainer: Color(0xFF2A1700),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFF7DEC5),
        secondary: Color(0xFF6D5B47),
        inversePrimary: Color(0xFFF9BB6C),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: const HSLColor.fromAHSL(1, 31, 1, 0.83).toColor(),
        onPrimaryContainer: const HSLColor.fromAHSL(1, 31, 1, 0.18).toColor(),
        primary: Color(0xFF83540D),
      ),
    );
