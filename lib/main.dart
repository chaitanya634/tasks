import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/providers/lists/starred.dart';
import 'package:tasks/providers/task_lists.dart';
import '../pages/home.dart';
import '../themes/dark.dart';
import '../themes/light.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => StarredList()),
      ChangeNotifierProvider(create: (context) => TaskLists()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightDynamic == null
                ? lightTheme()
                : dynamicLightTheme(lightDynamic),
            darkTheme: darkDynamic == null
                ? darkTheme()
                : dynamicDarkTheme(darkDynamic),
            themeMode: ThemeMode.system,
            home: const HomePage(),
          ));
}
