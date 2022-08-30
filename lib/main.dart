import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tasks/pages/home.dart';
import 'package:tasks/providers/date_time.dart';
import 'package:tasks/themes/light.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.red));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DateTimeProvider())
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
            theme: lightTheme(lightDynamic),
            home: HomePage(
              lightDynamic,
              darkDynamic,
              context: context,
            ));
      },
    );
  }
}
