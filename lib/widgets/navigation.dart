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
      child: Icon(IconData(0xe804,fontFamily: 'NavigationIcons'), size: 24),
    ),
  ),
  NavigationElement(
    label: 'My Day',
    icon: Icon(
      IconData(0xe806 ,fontFamily: 'NavigationIcons'), size: 22),
    selectedIcon: Icon(IconData(0xe805 ,fontFamily: 'NavigationIcons')),
  ),
  NavigationElement(
    label: 'Planned',
    icon: Icon(IconData(0xe803 ,fontFamily: 'NavigationIcons'), size: 22),
  ),
  NavigationElement(
    label: 'Starred',
    icon: Icon(IconData(0xe802 ,fontFamily: 'NavigationIcons'), size: 24),
    selectedIcon: Icon(IconData(0xe801 ,fontFamily: 'NavigationIcons'), size: 24),
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
