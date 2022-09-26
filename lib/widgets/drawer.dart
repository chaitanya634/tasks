import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_database/database_provider.dart';

import '../enums.dart';
import '../isar_database/collections.dart';
import 'lists_of_group.dart';
import 'loading.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody(this.colorScheme, {super.key});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    debugPrint('build drawer body');
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 128.0,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2,
              title: Text(
                'Tasks',
                style: TextStyle(
                  fontFamily: 'GreatVibes',
                  fontSize: 28,
                  color: colorScheme.primary,
                ),
              ),
              titlePadding: const EdgeInsets.only(
                left: 8,
                bottom: 0,
              ),
            ),
          ),

          //my lists label
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'My Lists',
                style: TextStyle(color: colorScheme.secondary),
              ),
            ),
          ),

          //my lists
          FutureBuilder<List<TaskList>>(
            future: context.read<DatabaseProvider>().fetchTaskListCollection(),
            builder: (context, snapshot) {
              debugPrint('build my lists');
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                context
                    .read<DatabaseProvider>()
                    .initTempTaskListCollection(snapshot.data!);
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: context
                        .watch<DatabaseProvider>()
                        .tempTaskListCollection
                        .where((taskList) =>
                            taskList.groupId == DefaultGroups.Main.index &&
                            taskList.id != DefaultLists.MyDay.index &&
                            taskList.id != DefaultLists.Starred.index &&
                            taskList.id != DefaultLists.Planned.index)
                        .length,
                    (context, index) {
                      debugPrint('build my list element');
                      var taskList = context
                          .watch<DatabaseProvider>()
                          .tempTaskListCollection
                          .where((element) =>
                              element.groupId == DefaultGroups.Main.index &&
                              element.id != DefaultLists.MyDay.index &&
                              element.id != DefaultLists.Starred.index &&
                              element.id != DefaultLists.Planned.index)
                          .elementAt(index);
                      var activeListId =
                          context.watch<DatabaseProvider>().activeListId;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ListTile(
                          shape: const StadiumBorder(),
                          tileColor: activeListId == taskList.id
                              ? colorScheme.primaryContainer
                              : null,
                          leading: Icon(
                            Icons.checklist_rounded,
                            color: activeListId == taskList.id
                                ? colorScheme.onPrimaryContainer
                                : colorScheme.secondary,
                          ),
                          title: Text(
                            taskList.name,
                            style: TextStyle(
                              color: activeListId == taskList.id
                                  ? colorScheme.onPrimaryContainer
                                  : colorScheme.secondary,
                            ),
                          ),
                          trailing: activeListId == taskList.id
                              ? IconButton(
                                  onPressed: null,
                                  icon: Badge(
                                    badgeContent: const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text('9'),
                                    ),
                                    badgeColor:
                                        const Color.fromARGB(40, 112, 160, 249),
                                    animationType: BadgeAnimationType.fade,
                                    animationDuration:
                                        const Duration(milliseconds: 400),
                                  ),
                                )
                              : IconButton(
                                  icon: Icon(
                                    Icons.remove_rounded,
                                    size: 18,
                                    color: colorScheme.onPrimaryContainer,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<DatabaseProvider>()
                                        .deleteTempTaskList(taskList);
                                    // provider.setActiveGroupId(
                                    //     DefaultGroups.Main.index);
                                    // provider.setActiveListId(
                                    //     DefaultLists.MyDay.index);
                                    // provider.setCurrentDayAppBarTitle();
                                  },
                                ),
                          onTap: () {
                            var databaseProvider =
                                context.read<DatabaseProvider>();
                            databaseProvider.setActiveGroupId(taskList.groupId);
                            databaseProvider.setActiveListId(taskList.id);
                            databaseProvider
                                .setCustomAppBarTitle(taskList.name);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
                );
              }
              return LoadingWidget(colorScheme);
            },
          ),

          //my groups label
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'My Groups',
                style: TextStyle(color: colorScheme.secondary),
              ),
            ),
          ),

          //my groups
          FutureBuilder<List<Group>>(
              future: context.read<DatabaseProvider>().fetchGroupCollection(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  context
                      .read<DatabaseProvider>()
                      .initTempGroupCollection(snapshot.data!);
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: context
                        .watch<DatabaseProvider>()
                        .tempGroupCollection
                        .where((group) => group.id != DefaultGroups.Main.index)
                        .length,
                    (context, index) {
                      var group = context
                          .watch<DatabaseProvider>()
                          .tempGroupCollection
                          .where(
                              (group) => group.id != DefaultGroups.Main.index)
                          .elementAt(index);
                      var activeGroupId =
                          context.watch<DatabaseProvider>().activeGroupId;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          shape: const StadiumBorder(),
                          tileColor: activeGroupId == group.id
                              ? colorScheme.primaryContainer
                              : null,
                          leading: Icon(
                            Icons.folder_outlined,
                            color: activeGroupId == group.id
                                ? colorScheme.onPrimaryContainer
                                : colorScheme.secondary,
                          ),
                          trailing: activeGroupId == group.id
                              ? null
                              : IconButton(
                                  icon: Icon(
                                    Icons.remove_rounded,
                                    size: 18,
                                    color: activeGroupId == group.id
                                        ? colorScheme.onPrimaryContainer
                                        : colorScheme.secondary,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<DatabaseProvider>()
                                        .deleteTempGroup(group);
                                    // provider.setActiveGroupId(
                                    //     DefaultGroups.Main.index);
                                    // provider.setActiveListId(
                                    //     DefaultLists.MyDay.index);
                                    // provider.setCurrentDayAppBarTitle();
                                  },
                                ),
                          title: Text(
                            group.name,
                            style: TextStyle(
                              color: activeGroupId == index + 1
                                  ? colorScheme.onPrimaryContainer
                                  : colorScheme.secondary,
                            ),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: colorScheme.background,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                              ),
                              builder: (context) => ListsOfGroup(
                                currentGroup: group,
                                colorScheme: colorScheme,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ));
                }
                return LoadingWidget(colorScheme);
              }),

          //info
          SliverToBoxAdapter(
            child: ListTile(
              title:
                  Text('Info', style: TextStyle(color: colorScheme.secondary)),
            ),
          ),

          //privacy policy
          SliverToBoxAdapter(
            child: ListTile(
              leading: Icon(
                Icons.policy_outlined,
                color: colorScheme.secondary,
              ),
              title: Text(
                'Privacy policy',
                style: TextStyle(color: colorScheme.secondary),
              ),
            ),
          ),

          //license
          SliverToBoxAdapter(
            child: ListTile(
              leading: Icon(
                Icons.article_outlined,
                color: colorScheme.secondary,
              ),
              title: Text('License',
                  style: TextStyle(color: colorScheme.secondary)),
              onTap: () => showLicensePage(
                context: context,
                applicationName: 'Tasks',
              ),
            ),
          ),

          //about
          SliverToBoxAdapter(
            child: ListTile(
              leading: Icon(Icons.notes_rounded, color: colorScheme.secondary),
              title: Text(
                'About',
                style: TextStyle(color: colorScheme.secondary),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 48,
        decoration: ShapeDecoration(
          color: colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(18),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //new list
            TextButton.icon(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      late String listName;
                      return AlertDialog(
                        backgroundColor: colorScheme.background,
                        title: const Text('New List'),
                        content: TextFormField(
                            onChanged: (value) => listName = value,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                label: const Text('List Name'))),
                        actions: [
                          //cancel
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            child: const Text('Save'),
                            onPressed: () {
                              var isAdded = context
                                  .read<DatabaseProvider>()
                                  .addTempTaskList(TaskList(
                                      id: context
                                          .read<DatabaseProvider>()
                                          .tempTaskListId(),
                                      groupId: DefaultGroups.Main.index,
                                      name: listName));
                              isAdded ? Navigator.pop(context) : null;
                            },
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.playlist_add_rounded,
                color: colorScheme.onSurface,
              ),
              label: Text(
                'Add list',
                style: TextStyle(color: colorScheme.onSurface),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.create_new_folder_outlined,
                color: colorScheme.onSurface,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      late String groupName;
                      return AlertDialog(
                        backgroundColor: colorScheme.background,
                        title: const Text('New Group'),
                        content: TextField(
                            onChanged: (value) => groupName = value,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                label: const Text('Group Name'))),
                        actions: [
                          //cancel
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                context.read<DatabaseProvider>().addTempGroup(
                                        Group(
                                            id: context
                                                .read<DatabaseProvider>()
                                                .tempGroupId(),
                                            name: groupName))
                                    ? Navigator.pop(context)
                                    : null;
                              },
                              child: const Text('Save')),
                        ],
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}




                // Expanded(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: const [
                //       Text(
                //         'Chaitanya',
                //         style: TextStyle(
                //             fontWeight: FontWeight.w700, fontSize: 16, height: 1),
                //       ),
                //       Text(
                //         'Jadhav',
                //         style: TextStyle(
                //             fontWeight: FontWeight.w600,
                //             fontSize: 13,
                //             height: 1.2),
                //       ),
                //     ],
                //   ),
                // ),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(Icons.logout_rounded),
                // ),