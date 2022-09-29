import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'enums.dart';
import 'isar_database/collections.dart';
import 'isar_database/database_provider.dart';
import 'layouts/desktop.dart';
import 'layouts/phone.dart';
import 'layouts/tablet.dart';
import 'themes/dark.dart';
import 'themes/light.dart';

void main() async {
  var widgetsFlutterBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);

  Directory? applicationSupportDirectory =
      kIsWeb ? null : await getApplicationSupportDirectory();
  Isar localDatabase = await Isar.open(
    schemas: [SubtaskSchema, TaskSchema, TaskListSchema, GroupSchema],
    directory: applicationSupportDirectory?.path,
  );

  // await localDatabase.writeTxn((isar) async => await isar.clear());
  //temporary database
  //required to avoid read-write delay
  Map<Collections, List<Object>> tempDatabase = {
    Collections.Groups: await localDatabase.groups.where().findAll(),
    Collections.TaskLists: await localDatabase.taskLists.where().findAll(),
    Collections.Tasks: await localDatabase.tasks.where().findAll(),
    Collections.Subtasks: await localDatabase.subtasks.where().findAll(),
  };

  runApp(
    ChangeNotifierProvider(
      create: (context) => DatabaseProvider(localDatabase, tempDatabase),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(),
        darkTheme: darkThemeData(),
        themeMode: ThemeMode.system,
        home: LayoutBuilder(
          builder: (context, constraints) {
            var scaffoldKey = GlobalKey<ScaffoldState>();
            var colorScheme = Theme.of(context).colorScheme;
            var viewportWidth = constraints.maxWidth;
            if (viewportWidth > 0 && viewportWidth < 466) {
              //0 to 465
              return PhoneLayout(colorScheme, scaffoldKey);
            } else if (viewportWidth > 465 && viewportWidth < 840) {
              //466 to 839
              return TabletLayout(colorScheme, scaffoldKey);
            } else {
              //840 to infinity
              return DesktopLayout(colorScheme);
            }
          },
        ),
      );
}
