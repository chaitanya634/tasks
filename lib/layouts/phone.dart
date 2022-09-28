import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/enums.dart';
import 'package:tasks/isar_database/collections.dart';
import 'package:tasks/isar_database/database_provider.dart';
import 'package:tasks/widgets/display_task.dart';

import '../functions.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class PhoneLayout extends StatelessWidget {
  const PhoneLayout(this.colorScheme, this.scaffoldKey, {super.key});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    debugPrint('build: scaffold');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: colorScheme.background,
      body: Builder(
        builder: (context) {
          debugPrint('build: scaffold body');
          var watchProvider = context.watch<DatabaseProvider>();
          return CustomScrollView(
            slivers: [
              //app bar
              SliverAppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                shadowColor: colorScheme.shadow,
                floating: true,
                pinned: true,
                expandedHeight: 150.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: context.select<DatabaseProvider, Widget>(
                    (value) {
                      debugPrint('build: appbar title');
                      return value.homePageAppBarTitle;
                    },
                  ),
                  titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
                  expandedTitleScale: 2,
                ),
              ),

              //tasks list
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: watchProvider.tempDatabase.entries
                      .singleWhere(
                          (element) => element.key == Collections.Tasks)
                      .value
                      .where((element) {
                    var task = element as Task;
                    return task.groupId == watchProvider.activeGroupId &&
                        task.listId == watchProvider.activeListId;
                  }).length,
                  (context, index) {
                    var task = watchProvider.tempDatabase.entries
                        .singleWhere(
                            (element) => element.key == Collections.Tasks)
                        .value
                        .where((element) {
                      var task = element as Task;
                      return task.groupId == watchProvider.activeGroupId &&
                          task.listId == watchProvider.activeListId;
                    }).elementAt(index) as Task;
                    return Column(
                      children: [
                        StatefulBuilder(
                          builder: (context, setState) {
                            return OpenContainer(
                              closedColor: colorScheme.background,
                              openColor: colorScheme.background,
                              transitionDuration:
                                  const Duration(milliseconds: 600),
                              openBuilder: (context, action) =>
                                  DisplayTask(colorScheme, task: task),
                              closedBuilder: (context, action) => ListTile(
                                minVerticalPadding: 18,
                                trailing: SizedBox(
                                  height: double.infinity,
                                  child: Checkbox(
                                    checkColor: colorScheme.onSecondary,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) {
                                        if (states.any((element) =>
                                            element ==
                                            MaterialState.selected)) {
                                          return colorScheme.secondary;
                                        }
                                        return colorScheme.onBackground;
                                      },
                                    ),
                                    value: task.isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        task.isChecked = value!;
                                      });
                                      context
                                          .read<DatabaseProvider>()
                                          .updateTaskChecked(value!, task);
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  task.title ?? '',
                                  style: TextStyle(
                                    color: colorScheme.secondary,
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: generateSubtitle(task, colorScheme),
                                onTap: action,
                              ),
                            );
                          },
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: OpenContainer(
        transitionDuration: const Duration(milliseconds: 750),
        openColor: colorScheme.background,
        openBuilder: (context, action) => DisplayTask(colorScheme),
        closedBuilder: (context, action) => FloatingActionButton(
          onPressed: action,
          child: const Icon(IconData(0xe800, fontFamily: 'NavigationIcons')),
        ),
        closedColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor!,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
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
