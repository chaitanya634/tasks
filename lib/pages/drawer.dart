import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_db/collections_provider.dart';

import '../isar_db/collections.dart';
import 'task_group.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2,
              title: Text(
                'Tasks',
                style: TextStyle(
                  fontFamily: 'GreatVibes',
                  fontSize: 28,
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
              titlePadding: const EdgeInsets.only(
                left: 8,
                bottom: 0,
              ),
            ),
            shadowColor: colorScheme.shadow,
            backgroundColor: colorScheme.secondaryContainer,
            floating: true,
            pinned: true,
            expandedHeight: 128.0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_rounded, color: colorScheme.secondary),
              )
            ],
          ),

          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'My Lists',
                style: TextStyle(color: colorScheme.primary),
              ),
            ),
          ),

          //my lists
          StreamBuilder<List<Lists>>(
              stream: context.read<CollectionsProvider>().getLists(1),
              builder: (context, snapshot) {
                debugPrint('lists: $snapshot');
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData &&
                    snapshot.data!.length - 3 > 0) {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: snapshot.data!.length - 3,
                    (context, index) {
                      var element = snapshot.data!.elementAt(index + 3);
                      return ListTile(
                        leading: const Icon(Icons.checklist_rounded),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.remove_rounded,
                            size: 18,
                          ),
                          onPressed: () {
                            var provider = context.read<CollectionsProvider>();
                            provider.setActiveGroupId(1);
                            provider.setActiveListId(1);
                            provider.setCurrentDayAppBarTitle();
                            provider.removeListAt(element.groupId, element.id);
                          },
                        ),
                        title: Text(element.name),
                        onTap: () {
                          var provider = context.read<CollectionsProvider>();
                          provider.setActiveGroupId(element.groupId);
                          provider.setActiveListId(element.id);
                          provider.setCustomAppBarTitle(element.name);
                          Navigator.pop(context);
                        },
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
                style: TextStyle(color: colorScheme.primary),
              ),
            ),
          ),

          //my groups
          StreamBuilder<List<Groups>>(
              stream: context.read<CollectionsProvider>().getGroups(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: snapshot.data!.length,
                    (context, index) {
                      var element = snapshot.data!.elementAt(index);
                      return ListTile(
                        leading: const Icon(Icons.folder_outlined),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.remove_rounded,
                            size: 18,
                          ),
                          onPressed: () {
                            var provider = context.read<CollectionsProvider>();
                            provider.setActiveGroupId(1);
                            provider.setActiveListId(1);
                            provider.setCurrentDayAppBarTitle();
                            provider.removeGroupAt(element.id);
                          },
                        ),
                        title: Text(element.name),
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            )),
                            context: context,
                            builder: (context) => TaskGroup(group: element),
                          );
                        },
                      );
                    },
                  ));
                }
                return const SliverToBoxAdapter(child: SizedBox());
              }),

          //info
          SliverToBoxAdapter(
            child: ListTile(
              title: Text('Info', style: TextStyle(color: colorScheme.primary)),
            ),
          ),

          //privacy policy
          const SliverToBoxAdapter(
            child: ListTile(
              leading: Icon(Icons.policy_outlined),
              title: Text('Privacy policy'),
            ),
          ),

          //license
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.article_outlined),
              title: const Text('License'),
              onTap: () => showLicensePage(
                context: context,
                applicationName: 'Tasks',
              ),
            ),
          ),

          //about
          const SliverToBoxAdapter(
            child: ListTile(
              leading: Icon(Icons.notes_rounded),
              title: Text('About'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                              context.read<CollectionsProvider>().addList(
                                    Lists()
                                      ..groupId = 1
                                      ..name = listName,
                                  );
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.playlist_add_rounded,
                color: colorScheme.primary,
              ),
              label: Text(
                'Add list',
                style: TextStyle(color: colorScheme.primary),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.create_new_folder_outlined,
                color: colorScheme.primary,
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
                                context
                                    .read<CollectionsProvider>()
                                    .addGroup(Groups()..name = groupName);
                                Navigator.pop(context);
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