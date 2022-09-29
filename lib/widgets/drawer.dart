import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/functions.dart';
import 'package:tasks/isar_database/database_provider.dart';
import 'package:tasks/widgets/message_page.dart';

import '../enums.dart';
import '../isar_database/collections.dart';
import 'lists_of_group.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody(this.colorScheme, {super.key, this.onDesktop = false});

  final ColorScheme colorScheme;
  final bool onDesktop;

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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: context
                  .watch<DatabaseProvider>()
                  .tempDatabase
                  .entries
                  .singleWhere(
                      (element) => element.key == Collections.TaskLists)
                  .value
                  .where((element) {
                element = element as TaskList;
                return element.groupId == DefaultGroups.Main.index &&
                    element.id != DefaultLists.MyDay.index &&
                    element.id != DefaultLists.Planned.index &&
                    element.id != DefaultLists.Starred.index;
              }).length,
              (context, index) {
                debugPrint('build my list element');
                var taskList = context
                    .watch<DatabaseProvider>()
                    .tempDatabase
                    .entries
                    .singleWhere(
                        (element) => element.key == Collections.TaskLists)
                    .value
                    .where((element) {
                  element = element as TaskList;
                  return element.groupId == DefaultGroups.Main.index &&
                      element.id != DefaultLists.MyDay.index &&
                      element.id != DefaultLists.Planned.index &&
                      element.id != DefaultLists.Starred.index;
                }).elementAt(index) as TaskList;
                var activeListId =
                    context.read<DatabaseProvider>().activeListId;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ListTile(
                    shape: const StadiumBorder(),
                    tileColor: activeListId == taskList.id
                        ? onDesktop
                            ? colorScheme.secondaryContainer
                            : colorScheme.primaryContainer
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
                              badgeContent: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(countTasks(context, taskList.id)),
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
                                  .removeList(taskList);
                            },
                          ),
                    onTap: () {
                      var databaseProvider = context.read<DatabaseProvider>();
                      databaseProvider.setActiveGroupId(taskList.groupId);
                      databaseProvider.setActiveListId(taskList.id);
                      databaseProvider.setCustomAppBarTitle(taskList.name);
                      if (!onDesktop) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                );
              },
            ),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: context
                  .watch<DatabaseProvider>()
                  .tempDatabase
                  .entries
                  .singleWhere((element) => element.key == Collections.Groups)
                  .value
                  .where((element) {
                element = element as Group;
                return element.id != DefaultGroups.Main.index;
              }).length,
              (context, index) {
                var group = context
                    .watch<DatabaseProvider>()
                    .tempDatabase
                    .entries
                    .singleWhere((element) => element.key == Collections.Groups)
                    .value
                    .where((element) {
                  element = element as Group;
                  return element.id != DefaultGroups.Main.index;
                }).elementAt(index) as Group;
                var activeGroupId =
                    context.watch<DatabaseProvider>().activeGroupId;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    shape: const StadiumBorder(),
                    tileColor: activeGroupId == group.id
                        ? onDesktop
                            ? colorScheme.secondaryContainer
                            : colorScheme.primaryContainer
                        : null,
                    leading: Icon(
                      Icons.folder_outlined,
                      color: activeGroupId == group.id
                          ? colorScheme.onPrimaryContainer
                          : colorScheme.secondary,
                    ),
                    trailing: activeGroupId == group.id
                        ? IconButton(
                            onPressed: null,
                            icon: Badge(
                              badgeContent: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(countLists(context, group.id)),
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
                                  .removeGroup(group);
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
                        constraints: const BoxConstraints(maxWidth: 500),
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
            ),
          ),

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
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessagePage(
                        title: 'Privacy Policy',
                        message:
                            'This application does not collect the data you have created such as tasks, '
                            'subtasks, lists, groups, it stores your '
                            'data on your device not on any centralized or distribured server.\n\n'
                            'Chaitanya Jadhav\n'
                            'Developer'),
                  )),
            ),
          ),

          //license
          SliverToBoxAdapter(
            child: ListTile(
              leading: Icon(
                Icons.article_outlined,
                color: colorScheme.secondary,
              ),
              title: Text(
                'Licenses',
                style: TextStyle(color: colorScheme.secondary),
              ),
              onTap: () => showLicensePage(
                context: context,
                applicationName: 'Tasks',
                applicationIcon: const Icon(Icons.task_alt_rounded),
                applicationVersion: '1.0.0',
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
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessagePage(
                      title: 'About',
                      message: 'Application Name: Tasks\n'
                          'Version: 1.0.0\n'
                          'Developed by Chaitanya Jadhav',
                      profile: true,
                    ),
                  )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 48,
        decoration: ShapeDecoration(
          color: onDesktop ? null : colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(18),
            ),
          ),
        ),
        child: Column(
          children: [
            Visibility(
              visible: onDesktop,
              child: const Divider(
                height: 1,
                endIndent: 4,
              ),
            ),
            Row(
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
                                        borderRadius:
                                            BorderRadius.circular(16)),
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
                                  context
                                      .read<DatabaseProvider>()
                                      .addList(
                                          generateId(
                                              context, Collections.TaskLists),
                                          DefaultGroups.Main.index,
                                          listName)
                                      .then((value) => Navigator.pop(context));
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
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    label: const Text('Group Name'))),
                            actions: [
                              //cancel
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel')),
                              TextButton(
                                onPressed: () {
                                  var group = Group(
                                      id: generateId(
                                          context, Collections.Groups),
                                      name: groupName);
                                  context
                                      .read<DatabaseProvider>()
                                      .addGroup(group)
                                      .then((value) => Navigator.pop(context));
                                },
                                child: const Text('Save'),
                              ),
                            ],
                          );
                        });
                  },
                )
              ],
            ),
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