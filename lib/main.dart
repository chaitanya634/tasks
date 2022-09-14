import 'package:dynamic_color/dynamic_color.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'providers/list_groups_handler.dart';
import 'providers/lists_handler.dart';

import 'pages/home.dart';

import 'themes/light.dart';
import 'themes/dark.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListsHandler()),
        ChangeNotifierProvider(create: (context) => ListGroupsHandler()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      DynamicColorBuilder(builder: (lightDynamic, darkDynamic) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightDynamic == null
              ? lightTheme()
              : dynamicLightTheme(lightDynamic),
          darkTheme:
              darkDynamic == null ? darkTheme() : dynamicDarkTheme(darkDynamic),
          themeMode: ThemeMode.system,
          home: HomePage(),
        )
    );
}
