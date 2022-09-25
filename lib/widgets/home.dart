/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_db/collections.dart';
import 'package:tasks/isar_db/isar_database_provider.dart';
import '../data/algos.dart';
import 'create_task.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      key: _scaffoldKey,
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
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return FutureBuilder(
                                    future: context
                                        .read<CollectionsProvider>()
                                        .getSubtasks(task.id!),
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
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 328),
        child: const Drawer(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12))),
          child: DrawerBody(),
        ),
      ),

      bottomNavigationBar: NavigationBar(
        height: 48,
        surfaceTintColor: colorScheme.surface,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            icon: RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.menu_open_rounded, size: 24),
            ),
            label: 'Menu',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.today),
            icon: Icon(Icons.today_outlined, size: 22),
            label: 'My Day',
          ),
          NavigationDestination(
            icon: Icon(Icons.task_alt_rounded, size: 22),
            label: 'Planned',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.star_rounded, size: 26),
            icon: Icon(Icons.star_outline_rounded, size: 26),
            label: 'Starred',
          ),
        ],
        onDestinationSelected: (value) {
          var readProvider = context.read<CollectionsProvider>();
          switch (value) {
            case 0:
              _scaffoldKey.currentState?.openDrawer();
              break;
            case 1:
              readProvider.setActiveGroupId(1);
              readProvider.setActiveListId(1);
              readProvider.setCurrentDayAppBarTitle();
              break;
            case 2:
              readProvider.setActiveGroupId(1);
              readProvider.setActiveListId(2);
              readProvider.setCustomAppBarTitle('Planned');
              break;
            case 3:
              readProvider.setActiveGroupId(1);
              readProvider.setActiveListId(3);
              readProvider.setCustomAppBarTitle('Starred');
              break;
            default:
          }
        },
      ),
      floatingActionButton: 
      
      FloatingActionButton(
        elevation: 2.5,
        backgroundColor: colorScheme.primaryContainer,
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
    );
  }
}
*/