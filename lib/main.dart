import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/home.dart';
import '../themes/dark.dart';
import '../themes/light.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const MyApp()),
  );
  runApp(const MyApp());
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
          darkTheme:
              darkDynamic == null ? darkTheme() : dynamicDarkTheme(darkDynamic),
          themeMode: ThemeMode.system,
          home: const HomePage(),
        ),
      );
}
