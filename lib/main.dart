import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/data.dart';
import 'package:tasks/pages/home.dart';
import 'package:tasks/providers/date_time.dart';
import 'package:tasks/themes/light.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DateTimeProvider()),
      ChangeNotifierProvider(create: ((context) => MyData())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightDynamic == null
                ? lightTheme()
                : dynamicLightTheme(lightDynamic),
            home: HomePage(
              lightDynamic,
              darkDynamic,
              context: context,
            ));
      },
    );
  }
}
