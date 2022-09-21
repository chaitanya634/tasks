import 'dart:io';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tasks/isar_db/collections_provider.dart';
import 'isar_db/collections.dart';
import 'pages/home.dart';
import 'themes/light.dart';
import 'themes/dark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationSupportDirectory();
  Isar isar = await Isar.open(
    [SubtasksSchema, TasksSchema, ListsSchema, GroupsSchema],
    directory: dir.path,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => CollectionsProvider(isar),
      child: const MyApp(),
    ),
  );
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
          home: HomePage(),
        ),
      );
}
