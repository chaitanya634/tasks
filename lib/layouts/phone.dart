import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_database/collections.dart';
import 'package:tasks/isar_database/database_provider.dart';
import 'package:tasks/widgets/display_task.dart';
import 'package:tasks/widgets/loading.dart';

import '../functions.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class PhoneLayout extends StatelessWidget {
  const PhoneLayout(this.colorScheme, this.scaffoldKey, {super.key});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    var readProvider = context.read<DatabaseProvider>();
    var watchProvider = context.watch<DatabaseProvider>();
    return FutureBuilder<List<Task>>(
      future: readProvider.fetchTaskCollection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          readProvider.initTempTaskCollection(snapshot.data!);
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: colorScheme.background,
            body: CustomScrollView(
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
                      (value) => value.homePageAppBarTitle,
                    ),
                    titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
                    expandedTitleScale: 2,
                  ),
                  // actions: [
                  //   PopupMenuButton(
                  //     icon: const Icon(
                  //         IconData(0xe813, fontFamily: 'OutlinedFontIcons')),
                  //     itemBuilder: (context) => <PopupMenuEntry>[
                  //       const PopupMenuItem(
                  //           child: ListTile(
                  //         title: Text('Creation'),
                  //       )),
                  //       const PopupMenuItem(
                  //           child: ListTile(
                  //         title: Text('Due date'),
                  //       )),
                  //       const PopupMenuItem(
                  //           child: ListTile(
                  //         title: Text('Starred'),
                  //       )),
                  //     ],
                  //   ),
                  //   IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(
                  //       IconData(0xe814, fontFamily: 'OutlinedFontIcons'),
                  //     ),
                  //   ),
                  //   PopupMenuButton(
                  //     icon: const Icon(
                  //         IconData(0xe815, fontFamily: 'OutlinedFontIcons')),
                  //     itemBuilder: (context) => <PopupMenuEntry>[
                  //       const PopupMenuItem(
                  //           child: ListTile(
                  //         title: Text('Reorder tasks'),
                  //       )),
                  //       const PopupMenuItem(
                  //           child: ListTile(
                  //         title: Text('Hide completed'),
                  //       )),
                  //       const PopupMenuItem(
                  //           child: ListTile(
                  //         title: Text('Print list'),
                  //       )),
                  //       const PopupMenuItem(
                  //           child: ListTile(
                  //         title: Text('Change theme'),
                  //       )),
                  //       const PopupMenuItem(
                  //           child: ListTile(
                  //         title: Text('Clear list'),
                  //       )),
                  //     ],
                  //   )
                  // ],
                ),

                //tasks list
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: watchProvider.tempTaskCollection
                        .where((element) =>
                            element.groupId == watchProvider.activeGroupId &&
                            element.listId == watchProvider.activeListId)
                        .length,
                    (context, index) {
                      var task = watchProvider.tempTaskCollection
                          .where((element) =>
                              element.groupId == watchProvider.activeGroupId &&
                              element.listId == watchProvider.activeListId)
                          .elementAt(index);
                      return Column(
                        children: [
                          StatefulBuilder(
                            builder: (context, setState) {
                              return ListTile(
                                minVerticalPadding: 18,
                                trailing: SizedBox(
                                  height: double.infinity,
                                  child: Checkbox(
                                    checkColor: colorScheme.onPrimary,
                                    activeColor: colorScheme.primary,
                                    value: task.isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        task.isChecked = value!;
                                      });
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
                                subtitle: generateSubtitle(task),
                                onTap: () async {
                                  // showGeneralDialog(
                                  //   context: context,
                                  //   pageBuilder: (context, animation,
                                  //       secondaryAnimation) {
                                  //     return FutureBuilder(
                                  //       future: context
                                  //           .read<CollectionsProvider>()
                                  //           .getSubtasks(task.id!),
                                  //       builder: (context, snapshot) {
                                  //         if (snapshot.connectionState ==
                                  //                 ConnectionState.done &&
                                  //             snapshot.hasData) {
                                  //           return CreateTaskPage(
                                  //               task,
                                  //               snapshot.data
                                  //                   as List<Subtasks>);
                                  //         }
                                  //         return const Scaffold(
                                  //             body: Center(
                                  //           child: SizedBox(
                                  //               width: 32,
                                  //               height: 32,
                                  //               child:
                                  //                   CircularProgressIndicator()),
                                  //         ));
                                  //       },
                                  //     );
                                  //   },
                                  // );
                                
                                },
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
            ),
            drawer: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 328),
              child: Drawer(child: DrawerBody(colorScheme)),
            ),
            onDrawerChanged: (isOpened) {
              //on drawer closed
              if (!isOpened) {
                context.read<DatabaseProvider>()
                  ..replaceTaskListCollection()
                  ..replaceGroupsCollection();
              }
            },
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FutureBuilder(
                      builder: (context, snapshot) {
                        return const DisplayTask();
                      },
                    );
                  },
                );
              },
              child:
                  const Icon(IconData(0xe800, fontFamily: 'NavigationIcons')),
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

        return Scaffold(
          backgroundColor: colorScheme.background,
          body: Center(
            child: Text(
              'Tasks',
              style: TextStyle(
                fontFamily: 'GreatVibes',
                fontSize: 72,
                color: colorScheme.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
