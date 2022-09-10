import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData dynamicDarkTheme(ColorScheme darkDynamic) => ThemeData(
      useMaterial3: true,
      colorScheme: darkDynamic,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
    );

ThemeData darkTheme() => ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFF9BB6C),
        primaryContainer: Color(0xFF653E00),
        onPrimary: Color(0xFF472A00),
        onPrimaryContainer: Color(0xFFFFDDB8),
        inversePrimary: Color(0xFF83540D),
        secondary: Color(0xFFDAC3AA),
        secondaryContainer: Color(0xFF544431),
        onSecondary: Color(0xFF3C2E1D),
        onSecondaryContainer: Color(0xFFF7DEC5),
        surface: Color(0xFF1F1B17),
        surfaceVariant: Color(0xFF4E453C),
        onSurface: Color(0xFFEAE1DB),
        onSurfaceVariant: Color(0xFFD1C4B8),
        inverseSurface: Color(0xFFEAE1DB),
        onInverseSurface: Color(0xFF34302C),
        background: Color(0xFF1F1B17),
        onBackground: Color(0xFFEAE1DB),
        outline: Color(0xFF9A8F84),
        error: Color(0xFFFFB4AB),
        shadow: Color(0xFF000000),
        tertiary: Color(0xFFBECBA7),
        tertiaryContainer: Color(0xFF3F4B2F),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFB4AB),
        surfaceTint: Color(0xFFF9BB6C),
      ),
    );


