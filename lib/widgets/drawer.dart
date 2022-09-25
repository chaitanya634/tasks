import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/data/enums.dart';
import 'package:tasks/isar_db/collections.dart';
import 'package:tasks/isar_db/isar_database_provider.dart';

import 'task_group.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody(this.colorScheme, {super.key});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
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
            floating: true,
            pinned: false,
            expandedHeight: 128.0,
          ),

          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'My Lists',
                style: TextStyle(color: colorScheme.secondary),
              ),
            ),
          ),

          //my lists
          StreamBuilder<List<TaskList>>(
              stream: context
                  .read<IsarDatabase>()
                  .getLists(DefaultGroups.Main.index),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData &&
                    snapshot.data!.length - 3 > 0) {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: snapshot.data!.length - 3,
                    (context, index) {
                      var element = snapshot.data!.elementAt(index + 3);
                      var activeListId =
                          context.watch<IsarDatabase>().activeListId;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ListTile(
                          shape: const StadiumBorder(),
                          tileColor: activeListId == index + 3
                              ? colorScheme.primaryContainer
                              : null,
                          leading: Icon(
                            Icons.checklist_rounded,
                            color: activeListId == index + 3
                                ? colorScheme.onPrimaryContainer
                                : colorScheme.secondary,
                          ),
                          title: Text(
                            element.name,
                            style: TextStyle(
                              color: activeListId == index + 3
                                  ? colorScheme.onPrimaryContainer
                                  : colorScheme.secondary,
                            ),
                          ),
                          trailing: activeListId == index + 3
                              ? IconButton(
                                  icon: Icon(
                                    Icons.remove_rounded,
                                    size: 18,
                                    color: colorScheme.onPrimaryContainer,
                                  ),
                                  onPressed: () {
                                    var provider = context.read<IsarDatabase>();
                                    provider.setActiveGroupId(
                                        DefaultGroups.Main.index);
                                    provider.setActiveListId(
                                        DefaultLists.MyDay.index);
                                    provider.setCurrentDayAppBarTitle();
                                    provider.removeListAt(
                                        element.groupId, element.id!);
                                  },
                                )
                              : null,
                          onTap: () {
                            var provider = context.read<IsarDatabase>();
                            provider.setActiveGroupId(element.groupId);
                            provider.setActiveListId(element.id!);
                            provider.setCustomAppBarTitle(element.name);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ));
                }
                return const SliverToBoxAdapter(child: SizedBox());
              }),

          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'My Groups',
                style: TextStyle(color: colorScheme.secondary),
              ),
            ),
          ),

          //my groups
          StreamBuilder<List<Group>>(
              stream: context.read<IsarDatabase>().getGroups(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: snapshot.data!.length,
                    (context, index) {
                      var element = snapshot.data!.elementAt(index);
                      var activeGroupId =
                          context.watch<IsarDatabase>().activeGroupId;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          shape: const StadiumBorder(),
                          tileColor: activeGroupId == index + 1
                              ? colorScheme.primaryContainer
                              : null,
                          leading: Icon(
                            Icons.folder_outlined,
                            color: activeGroupId == index + 1
                                ? colorScheme.onPrimaryContainer
                                : colorScheme.secondary,
                          ),
                          trailing: activeGroupId == index + 1
                              ? IconButton(
                                  icon: Icon(
                                    Icons.remove_rounded,
                                    size: 18,
                                    color: activeGroupId == index + 1
                                        ? colorScheme.onPrimaryContainer
                                        : colorScheme.secondary,
                                  ),
                                  onPressed: () {
                                    var provider = context.read<IsarDatabase>();
                                    provider.setActiveGroupId(
                                        DefaultGroups.Main.index);
                                    provider.setActiveListId(
                                        DefaultLists.MyDay.index);
                                    provider.setCurrentDayAppBarTitle();
                                    provider.removeGroupAt(element.id!);
                                  },
                                )
                              : null,
                          title: Text(
                            element.name,
                            style: TextStyle(
                              color: activeGroupId == index + 1
                                  ? colorScheme.onPrimaryContainer
                                  : colorScheme.secondary,
                            ),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              constraints: const BoxConstraints(maxWidth: 420),
                              backgroundColor: colorScheme.background,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              )),
                              context: context,
                              builder: (context) =>
                                  TaskGroup(colorScheme, group: element),
                            );
                          },
                        ),
                      );
                    },
                  ));
                }
                return const SliverToBoxAdapter(child: SizedBox());
              }),

          //     // //info
          //     // SliverToBoxAdapter(
          //     //   child: ListTile(
          //     //     title: Text('Info', style: TextStyle(color: colorScheme.primary)),
          //     //   ),
          //     // ),

          //     // //privacy policy
          //     // const SliverToBoxAdapter(
          //     //   child: ListTile(
          //     //     leading: Icon(Icons.policy_outlined),
          //     //     title: Text('Privacy policy'),
          //     //   ),
          //     // ),

          //     // //license
          //     // SliverToBoxAdapter(
          //     //   child: ListTile(
          //     //     leading: const Icon(Icons.article_outlined),
          //     //     title: const Text('License'),
          //     //     onTap: () => showLicensePage(
          //     //       context: context,
          //     //       applicationName: 'Tasks',
          //     //     ),
          //     //   ),
          //     // ),

          //     // //about
          //     // const SliverToBoxAdapter(
          //     //   child: ListTile(
          //     //     leading: Icon(Icons.notes_rounded),
          //     //     title: Text('About'),
          //     //   ),
          //     // ),
        ],
      ),

      //bottom app bar
      bottomNavigationBar: Container(
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
                        title: const Text('New List'),
                        content: TextField(
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
                              // context.read<CollectionsProvider>().addList(
                              //       Lists()
                              //         ..groupId = 1
                              //         ..name = listName,
                              //     );
                              // Navigator.pop(context);
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
                                // context
                                //     .read<CollectionsProvider>()
                                //     .addGroup(Groups()..name = groupName);
                                // Navigator.pop(context);
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