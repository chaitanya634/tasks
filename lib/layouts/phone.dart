import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_database/database_provider.dart';
import 'package:tasks/widgets/fab.dart';
import 'package:tasks/widgets/tasks_of_list.dart';

import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class PhoneLayout extends StatelessWidget {
  const PhoneLayout(this.colorScheme, this.scaffoldKey, {super.key});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: colorScheme.background,
      body: Builder(
        builder: (context) => tasksOfList(context, colorScheme),
      ),
      floatingActionButton: Fab(colorScheme),
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 328),
        child: Drawer(child: DrawerBody(colorScheme)),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: navigationElements
            .map(
              (navigationElement) => NavigationDestination(
                label: navigationElement.label,
                icon: navigationElement.icon,
                selectedIcon: navigationElement.selectedIcon,
              ),
            )
            .toList(),
        onDestinationSelected: (destinationIndex) =>
            onNavigationElementSelected(
          context,
          destinationIndex,
          scaffoldKey,
        ),
        selectedIndex: context.select<DatabaseProvider, int>((isar) {
          int listId = isar.activeListId;
          return listId > 2 ? 0 : listId + 1;
        }),
      ),
    );
  }
}
