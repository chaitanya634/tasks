import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightThemeData() => ThemeData(
      useMaterial3: true,
      cardColor: const Color(0xffFFFBFF),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          foregroundColor: Color(0xff34302C),
          backgroundColor: Color(0xffF8EFE9)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff83540D),
          foregroundColor: Color(0xffFFFFFF)),
      colorScheme: const ColorScheme.light(
        background: Color(0xffFFFBFF),
        onBackground: Color(0xff6D5B47),
        outline: Color(0xffEEE0D4),
        surface: Color(0xffF8EFE9),
        onSurface: Color(0xff34302C),
        primary: Color(0xff83540D),
        primaryContainer: Color(0xffF8EFE9),
        onPrimaryContainer: Color(0xff2A1700),
        secondary: Color(0xff6D5B47),
        secondaryContainer: Color(0xffF7DEC5),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xffFFFBFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 48,
        surfaceTintColor: const Color(0xffF8EFE9),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: const Color(0xffF7DEC5),
        iconTheme: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) => IconThemeData(
              color: states.any((state) => state == MaterialState.selected)
                  ? const Color(0xff34302C)
                  : const Color(0xff83540D)),
        ),
      ),
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: Color(0xffF8EFE9),
        labelType: NavigationRailLabelType.none,
        indicatorColor: Color(0xffF7DEC5),
        selectedIconTheme: IconThemeData(color: Color(0xff34302C)),
        unselectedIconTheme: IconThemeData(color: Color(0xff83540D)),
      ),
    );
