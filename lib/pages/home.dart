import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_db/collections.dart';
import 'package:tasks/isar_db/collections_provider.dart';
import '../data/algos.dart';
import 'create_task.dart';

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
              title: Builder(
                builder: (context) {
                  debugPrint('build home page app bar title');
                  return context.select<CollectionsProvider, Widget>(
                      (value) => value.homePageAppBarTitle);
                },
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
                            onTap: () {
                              showGeneralDialog(
                                context: context,
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return CreateTaskPage(task);
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

              return const SliverToBoxAdapter(child: Text('test'));
            },
          ),
        ],
      ),
      // drawer: const Drawer(
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //           topRight: Radius.circular(12),
      //           bottomRight: Radius.circular(12))),
      //   child: DrawerBody(),
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   color: colorScheme.secondaryContainer,
      //   shape: const CircularNotchedRectangle(),
      //   child: Wrap(
      //     children: [
      //       //Menu
      //       IconButton(
      //         icon: Icon(
      //           Icons.menu_rounded,
      //           color: colorScheme.inverseSurface,
      //         ),
      //         onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      //       ),

      //       //MyDay
      //       IconButton(
      //         icon: Icon(
      //           context.watch<ListsHandler>().activeListName ==
      //                   DefaultLists.MyDay.name
      //               ? Icons.today
      //               : Icons.today_outlined,
      //           color: context.watch<ListsHandler>().activeListName ==
      //                   DefaultLists.MyDay.name
      //               ? colorScheme.primary
      //               : colorScheme.inverseSurface,
      //           size: 21,
      //         ),
      //         onPressed: () {
      //           context
      //               .read<ListsHandler>()
      //               .setActiveGroup(DefaultListGroup.main.name);
      //           context
      //               .read<ListsHandler>()
      //               .setActiveList(DefaultLists.MyDay.name);
      //           context.read<ListsHandler>().setCurrentDayTitle();
      //         },
      //       ),

      //       //Planned
      //       IconButton(
      //         icon: Icon(
      //           Icons.task_alt_rounded,
      //           color: context.watch<ListsHandler>().activeListName ==
      //                   DefaultLists.Planned.name
      //               ? colorScheme.primary
      //               : colorScheme.inverseSurface,
      //           size: 21,
      //         ),
      //         onPressed: () {
      //           context
      //               .read<ListsHandler>()
      //               .setActiveGroup(DefaultListGroup.main.name);
      //           context
      //               .read<ListsHandler>()
      //               .setCustomTitle(DefaultLists.Planned.name);
      //           context
      //               .read<ListsHandler>()
      //               .setActiveList(DefaultLists.Planned.name);
      //         },
      //       ),

      //       //Starred
      //       IconButton(
      //         icon: Icon(
      //           context.watch<ListsHandler>().activeListName ==
      //                   DefaultLists.Starred.name
      //               ? Icons.star_rounded
      //               : Icons.star_outline_rounded,
      //           color: context.watch<ListsHandler>().activeListName ==
      //                   DefaultLists.Starred.name
      //               ? colorScheme.primary
      //               : colorScheme.inverseSurface,
      //         ),
      //         onPressed: () {
      //           context
      //               .read<ListsHandler>()
      //               .setActiveGroup(DefaultListGroup.main.name);
      //           context
      //               .read<ListsHandler>()
      //               .setCustomTitle(DefaultLists.Starred.name);
      //           context
      //               .read<ListsHandler>()
      //               .setActiveList(DefaultLists.Starred.name);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.5,
        backgroundColor: colorScheme.primaryContainer,
        shape: const CircleBorder(),
        onPressed: () {
          showGeneralDialog(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) =>
                const CreateTaskPage(null),
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
