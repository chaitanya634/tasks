import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkThemeData() => ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 48,
        surfaceTintColor:
            const HSLColor.fromAHSL(1, 240, 0.28, 0.041).toColor(),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: const HSLColor.fromAHSL(1, 209, 0.28, 0.14).toColor(),
        iconTheme: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) => IconThemeData(
            color: states.any((state) => state == MaterialState.selected)
                ? const HSLColor.fromAHSL(1, 180, 1, 0.8).toColor()
                : const HSLColor.fromAHSL(1, 180, 1, 0.374).toColor(),
          ),
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: const HSLColor.fromAHSL(1, 209, 0.28, 0.06).toColor(),
        scrimColor: const HSLColor.fromAHSL(0.78, 0, 0, 0).toColor(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const HSLColor.fromAHSL(1, 250, 0.2, 0.17).toColor(),
        foregroundColor: const HSLColor.fromAHSL(1, 180, 1, 0.36).toColor(),
      ),
      colorScheme: ColorScheme.dark(
        background: const HSLColor.fromAHSL(1, 209, 0.28, 0.08).toColor(),
        onBackground: const HSLColor.fromAHSL(1, 180, 1, 0.4).toColor(),
        outline: const HSLColor.fromAHSL(1, 180, 1, 0.26).toColor(),
        surface: const HSLColor.fromAHSL(1, 240, 0.28, 0.041).toColor(),
        onSurface: const HSLColor.fromAHSL(1, 180, 1, 0.38).toColor(),
        primary: const HSLColor.fromAHSL(1, 180, 1, 0.8).toColor(),
        primaryContainer:
            const HSLColor.fromAHSL(1, 209, 0.28, 0.085).toColor(),
        onPrimaryContainer: const HSLColor.fromAHSL(1, 180, 1, 0.94).toColor(),
        secondary: const HSLColor.fromAHSL(1, 180, 1, 0.44).toColor(),
        secondaryContainer: const HSLColor.fromAHSL(1, 209, 0.28, 0.07).toColor()
      ),
    );

/*
ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFF9BB6C),
        primaryContainer: const HSLColor.fromAHSL(1, 37, 1, 0.22).toColor(),
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
        background: HSLColor.fromAHSL(1, 0, 0, 0.19).toColor(),
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
*/