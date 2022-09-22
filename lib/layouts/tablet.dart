import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/pages/drawer.dart';

import '../data/algos.dart';
import '../isar_db/collections.dart';
import '../isar_db/collections_provider.dart';
import '../pages/create_task.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: [
          NavigationRail(
            elevation: 4,
            groupAlignment: 0,
            backgroundColor: colorScheme.surface,
            leading: SizedBox(
              height: 72,
              child: IconButton(
                onPressed: () {
                  debugPrint('sk: ${scaffoldKey.currentState}');
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu_open_rounded,
                  color: colorScheme.secondary,
                ),
              ),
            ),
            trailing: const SizedBox(height: 72),
            onDestinationSelected: (value) {
              var provider = context.read<CollectionsProvider>();
              switch (value) {
                case 0:
                  provider.setActiveGroupId(1);
                  provider.setActiveListId(1);
                  provider.setCurrentDayAppBarTitle();
                  break;
                case 1:
                  provider.setActiveGroupId(1);
                  provider.setActiveListId(2);
                  provider.setCustomAppBarTitle('Planned');
                  break;
                case 2:
                  provider.setActiveGroupId(1);
                  provider.setActiveListId(3);
                  provider.setCustomAppBarTitle('Starred');
                  break;
              }
            },
            destinations: [
              NavigationRailDestination(
                icon: Icon(
                  context.watch<CollectionsProvider>().activeListId == 1
                      ? Icons.today
                      : Icons.today_outlined,
                  color: context.watch<CollectionsProvider>().activeListId == 1
                      ? null
                      : colorScheme.secondary,
                  size: 21,
                ),
                label: const Text('My Day'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.task_alt_rounded,
                  color: context.watch<CollectionsProvider>().activeListId == 2
                      ? null
                      : colorScheme.secondary,
                  size: 21,
                ),
                label: const Text('Planned'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  context.watch<CollectionsProvider>().activeListId == 3
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  color: context.watch<CollectionsProvider>().activeListId == 3
                      ? null
                      : colorScheme.secondary,
                ),
                label: const Text('Starred'),
              ),
            ],
            selectedIndex:
                context.watch<CollectionsProvider>().activeListId - 1 < 3
                    ? context.watch<CollectionsProvider>().activeListId - 1
                    : null,
          ),
          const VerticalDivider(width: 1, thickness: 1),
          Expanded(
            child: CustomScrollView(
              slivers: [
                //app bar
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  shadowColor: colorScheme.shadow,
                  floating: true,
                  pinned: true,
                  expandedHeight: 116.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: context.select<CollectionsProvider, Widget>(
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
                StreamBuilder(
                  stream: context.read<CollectionsProvider>().getTasks(),
                  builder: (context, snapshot) {
                    debugPrint('build home page list');
                    if (snapshot.connectionState == ConnectionState.active &&
                        snapshot.hasData) {
                      var data = snapshot.data as List<Tasks>;
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: data.length,
                          (context, index) {
                            debugPrint('build home page list element');
                            var task = data.elementAt(index);
                            return Column(
                              children: [
                                ListTile(
                                  minVerticalPadding: 18,
                                  trailing: SizedBox(
                                    height: double.infinity,
                                    child: Checkbox(
                                      checkColor: colorScheme.onPrimary,
                                      activeColor: colorScheme.primary,
                                      value: task.isChecked,
                                      onChanged: (value) {
                                        context
                                            .read<CollectionsProvider>()
                                            .updateTaskChecked(value!, task.id!);
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
                                    showGeneralDialog(
                                      context: context,
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return FutureBuilder(
                                          future: context
                                              .read<CollectionsProvider>()
                                              .getSubtasks(task.id!),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                    ConnectionState.done &&
                                                snapshot.hasData) {
                                              return CreateTaskPage(
                                                  task,
                                                  snapshot.data
                                                      as List<Subtasks>);
                                            }
                                            return const Scaffold(
                                                body: Center(
                                              child: SizedBox(
                                                  width: 32,
                                                  height: 32,
                                                  child:
                                                      CircularProgressIndicator()),
                                            ));
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                const Divider(height: 1),
                              ],
                            );
                          },
                        ),
                      );
                    }
                    return const SliverToBoxAdapter(child: SizedBox());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const Drawer(child: DrawerBody()),
      floatingActionButton: FloatingActionButton(
        elevation: 2.5,
        backgroundColor: colorScheme.secondaryContainer,
        onPressed: () {
          showGeneralDialog(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) =>
                FutureBuilder(
              future: context.read<CollectionsProvider>().getUniqueTaskId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CreateTaskPage(null, null,
                      newTaskId: snapshot.data as int);
                }
                return const Scaffold(
                    body: Center(
                  child: SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator()),
                ));
              },
            ),
          );
        },
        child: Icon(
          Icons.add_rounded,
          color: colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
