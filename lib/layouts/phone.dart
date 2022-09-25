import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../isar_db/isar_database_provider.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class PhoneLayout extends StatelessWidget {
  const PhoneLayout(this.colorScheme, this.scaffoldKey, {super.key});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      key: scaffoldKey,
      drawer: Drawer(child: DrawerBody(colorScheme)),
      onDrawerChanged: (isOpened) {
        debugPrint('is opened $isOpened');
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(IconData(0xe800, fontFamily: 'NavigationIcons')),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: navigationElements
            .map(
              (e) => NavigationDestination(
                label: e.label,
                icon: e.icon,
                selectedIcon: e.selectedIcon,
              ),
            )
            .toList(),
        onDestinationSelected: (value) => onNavigationElementSelected(
          context,
          value,
          scaffoldKey,
        ),
        selectedIndex: context.select<IsarDatabase, int>((isar) {
          int listId = isar.activeListId;
          return listId > 2 ? 0 : listId + 1;
        }),
      ),
    );
  }
}
