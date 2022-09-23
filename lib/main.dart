import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'isar_db/collections.dart';
import 'isar_db/isar_database_provider.dart';
import 'layouts/desktop.dart';
import 'layouts/phone.dart';
import 'layouts/tablet.dart';
import 'themes/dark.dart';
import 'themes/light.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory? directory = kIsWeb ? null : await getApplicationSupportDirectory();
  Isar isar = await Isar.open(
    schemas: [SubtaskSchema, TaskSchema, TaskListSchema, GroupSchema],
    directory: directory?.path,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => IsarDatabase(isar),
      child: const App(),
    ),
  );
}


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        themeMode: ThemeMode.system,
        home: LayoutBuilder(
          builder: (context, constraints) {
            double viewportWidth = constraints.maxWidth;
            if (viewportWidth > 0 && viewportWidth < 466) {
              //0 to 465
              return const PhoneLayout();
            } else if (viewportWidth > 465 && viewportWidth < 840) {
              //466 to 839
              return const TabletLayout();
            } else {
              //840 to infinity
              return const DesktopLayout();
            }
          },
        ),
      );
}