import 'package:flutter/material.dart';
import 'package:tasks/widgets/fab.dart';
import 'package:tasks/widgets/tasks_of_list.dart';

import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout(this.colorScheme, this.scaffoldKey, {super.key});

  final ColorScheme colorScheme;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: colorScheme.background,
      body: Row(
        children: [
          navigationRail(context, scaffoldKey, colorScheme),
          Expanded(child: tasksOfList(context, colorScheme)),
        ],
      ),
      drawer: Drawer(child: DrawerBody(colorScheme)),
      floatingActionButton: Fab(colorScheme),
    );
  }
}
