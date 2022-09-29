import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums.dart';
import '../isar_database/database_provider.dart';

class NavigationElement {
  const NavigationElement({
    required this.label,
    required this.icon,
    this.selectedIcon,
  });
  final String label;
  final Widget icon;
  final Widget? selectedIcon;
}

List<NavigationElement> navigationElements = const [
  NavigationElement(
    label: 'Menu',
    icon: RotatedBox(
      quarterTurns: 2,
      child: Icon(IconData(0xe804, fontFamily: 'NavigationIcons'), size: 24),
    ),
  ),
  NavigationElement(
    label: 'My Day',
    icon: Icon(IconData(0xe806, fontFamily: 'NavigationIcons'), size: 22),
    selectedIcon: Icon(IconData(0xe805, fontFamily: 'NavigationIcons')),
  ),
  NavigationElement(
    label: 'Planned',
    icon: Icon(IconData(0xe803, fontFamily: 'NavigationIcons'), size: 22),
  ),
  NavigationElement(
    label: 'Starred',
    icon: Icon(IconData(0xe802, fontFamily: 'NavigationIcons'), size: 24),
    selectedIcon:
        Icon(IconData(0xe801, fontFamily: 'NavigationIcons'), size: 24),
  )
];

void onNavigationElementSelected(
  BuildContext context,
  int elementIndex,
  GlobalKey<ScaffoldState> scaffoldKey,
) {
  var readProvider = context.read<DatabaseProvider>();
  switch (elementIndex) {
    case 0:
      scaffoldKey.currentState?.openDrawer();
      break;
    case 1:
      readProvider.setActiveGroupId(DefaultGroups.Main.index);
      readProvider.setActiveListId(DefaultLists.MyDay.index);
      readProvider.setCurrentDayAppBarTitle();
      break;
    case 2:
      readProvider.setActiveGroupId(DefaultGroups.Main.index);
      readProvider.setActiveListId(DefaultLists.Planned.index);
      readProvider.setCustomAppBarTitle(DefaultLists.Planned.name);
      break;
    case 3:
      readProvider.setActiveGroupId(DefaultGroups.Main.index);
      readProvider.setActiveListId(DefaultLists.Starred.index);
      readProvider.setCustomAppBarTitle(DefaultLists.Starred.name);
      break;
    default:
  }
}

NavigationRail navigationRail(BuildContext context,
    GlobalKey<ScaffoldState>? scaffoldKey, ColorScheme colorScheme) {
  var activeListId = context.watch<DatabaseProvider>().activeListId;
  return NavigationRail(
    elevation: 4,
    groupAlignment: 0,
    backgroundColor: scaffoldKey != null ? colorScheme.surface : colorScheme.background,
    leading: scaffoldKey != null
        ? IconButton(
            style: IconButton.styleFrom(
              backgroundColor: activeListId > 2
                  ? Theme.of(context).navigationRailTheme.indicatorColor
                  : null,
            ),
            color: Theme.of(context).navigationRailTheme.unselectedIconTheme!.color,
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: RotatedBox(
              quarterTurns: 2,
              child: Icon(
                const IconData(0xe804, fontFamily: 'NavigationIcons'),
                size: 24,
                color: activeListId > 2
                    ? Theme.of(context).navigationRailTheme.selectedIconTheme!.color
                    : null,
              ),
            ),
          )
        : null,
    destinations: navigationElements
        .sublist(1)
        .map(
          (navigationElement) => NavigationRailDestination(
            label: Text(navigationElement.label),
            icon: navigationElement.icon,
            selectedIcon: navigationElement.selectedIcon,
          ),
        )
        .toList(),
    onDestinationSelected: (destinationIndex) {
      var readProvider = context.read<DatabaseProvider>();
      switch (destinationIndex) {
        case 0:
          readProvider.setActiveGroupId(DefaultGroups.Main.index);
          readProvider.setActiveListId(DefaultLists.MyDay.index);
          readProvider.setCurrentDayAppBarTitle();
          break;
        case 1:
          readProvider.setActiveGroupId(DefaultGroups.Main.index);
          readProvider.setActiveListId(DefaultLists.Planned.index);
          readProvider.setCustomAppBarTitle(DefaultLists.Planned.name);
          break;
        case 2:
          readProvider.setActiveGroupId(DefaultGroups.Main.index);
          readProvider.setActiveListId(DefaultLists.Starred.index);
          readProvider.setCustomAppBarTitle(DefaultLists.Starred.name);
          break;
        default:
      }
    },
    selectedIndex: context.select<DatabaseProvider, dynamic>((isar) {
      int listId = isar.activeListId;
      return listId > 2 ? null : listId;
    }),
  );
}
