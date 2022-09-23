import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tasks/isar_db/collections_provider.dart';
import 'package:tasks/layouts/desktop.dart';
import 'package:tasks/layouts/phone.dart';
import 'package:tasks/layouts/tablet.dart';
import 'isar_db/collections.dart';
import 'themes/light.dart';
import 'themes/dark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory? dir;
  if (!kIsWeb) {
    dir = await getApplicationSupportDirectory();
  }
  Isar isar = await Isar.open(
    schemas: [SubtasksSchema, TasksSchema, ListsSchema, GroupsSchema],
    directory: dir?.path,
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
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        // lightDynamic == null
        //     ? lightTheme()
        //     : dynamicLightTheme(lightDynamic),
        darkTheme: darkTheme(),
        // darkDynamic == null ? darkTheme() : dynamicDarkTheme(darkDynamic),
        themeMode: ThemeMode.system,
        home: LayoutBuilder(
          builder: (context, constraints) {
            debugPrint(constraints.maxWidth.toString());
            if (constraints.maxHeight < 240) {
              return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.height,
                      size: 120,
                    ),
                    Icon(
                      Icons.error_outline_rounded,
                      size: 120,
                    )
                  ]);
            }
            if (constraints.maxWidth > 0 && constraints.maxWidth < 466) {
              return const PhoneLayout();
            } else if (constraints.maxWidth > 465 &&
                constraints.maxWidth < 840) {
              return const TabletLayout();
            } else {
              return const DesktopLayout();
            }
          },
        ),
      );
}
