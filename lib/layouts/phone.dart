import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_database/database_provider.dart';

import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class PhoneLayout extends StatelessWidget {
  const PhoneLayout(this.colorScheme, this.scaffoldKey, {super.key});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        backgroundColor: colorScheme.background,
        drawer: Drawer(child: DrawerBody(colorScheme)),
        onDrawerChanged: (isOpened) {
          //on drawer closed
          if (!isOpened) {
            context.read<DatabaseProvider>()
              ..replaceTaskListCollection()
              ..replaceGroupsCollection();
          }
        },
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(IconData(0xe800, fontFamily: 'NavigationIcons')),
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
