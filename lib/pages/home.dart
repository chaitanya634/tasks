import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_db/collections.dart';
import 'package:tasks/isar_db/collections_provider.dart';
import '../data/algos.dart';
import 'create_task.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    debugPrint('build home page');
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          //app bar
          SliverAppBar(
            automaticallyImplyLeading: false,
            shadowColor: colorScheme.shadow,
            floating: true,
            pinned: true,
            expandedHeight: 150.0,
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
                                      .updateTaskChecked(value!, task.id);
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
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return FutureBuilder(
                                    future: context
                                        .read<CollectionsProvider>()
                                        .getSubtasks(task.id),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                              ConnectionState.done &&
                                          snapshot.hasData) {
                                        return CreateTaskPage(task,
                                            snapshot.data as List<Subtasks>);
                                      }
                                      return const Scaffold(
                                          body: Center(
                                        child: SizedBox(
                                            width: 32,
                                            height: 32,
                                            child: CircularProgressIndicator()),
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
      drawer: const Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        child: DrawerBody(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: colorScheme.secondaryContainer,
        shape: const CircularNotchedRectangle(),
        child: Wrap(
          children: [
            //Menu
            IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: colorScheme.inverseSurface,
              ),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),

            //MyDay
            IconButton(
              icon: Icon(
                context.watch<CollectionsProvider>().activeListId == 1
                    ? Icons.today
                    : Icons.today_outlined,
                color: context.watch<CollectionsProvider>().activeListId == 1
                    ? colorScheme.primary
                    : colorScheme.inverseSurface,
                size: 21,
              ),
              onPressed: () {
                context.read<CollectionsProvider>().setActiveGroupId(1);
                context.read<CollectionsProvider>().setActiveListId(1);
                context.read<CollectionsProvider>().setCurrentDayAppBarTitle();
              },
            ),

            // Planned
            IconButton(
              icon: Icon(
                Icons.task_alt_rounded,
                color: context.watch<CollectionsProvider>().activeListId == 2
                    ? colorScheme.primary
                    : colorScheme.inverseSurface,
                size: 21,
              ),
              onPressed: () {
                context.read<CollectionsProvider>().setActiveGroupId(1);
                context
                    .read<CollectionsProvider>()
                    .setCustomAppBarTitle('Planned');
                context.read<CollectionsProvider>().setActiveListId(2);
              },
            ),

            //Starred
            IconButton(
              icon: Icon(
                context.watch<CollectionsProvider>().activeListId == 3
                    ? Icons.star_rounded
                    : Icons.star_outline_rounded,
                color: context.watch<CollectionsProvider>().activeListId == 3
                    ? colorScheme.primary
                    : colorScheme.inverseSurface,
              ),
              onPressed: () {
                context
                    .read<CollectionsProvider>()
                    .setActiveGroupId(1);
                context
                    .read<CollectionsProvider>()
                    .setCustomAppBarTitle('Starred');
                context
                    .read<CollectionsProvider>()
                    .setActiveListId(3);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.5,
        backgroundColor: colorScheme.primaryContainer,
        shape: const CircleBorder(),
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
          color: colorScheme.onPrimaryContainer,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
