import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/providers/my_groups.dart';
import 'package:tasks/providers/my_lists.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  State<DrawerBody> createState() => _DrawerBody();
}

class _DrawerBody extends State<DrawerBody> {
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
          SliverReorderableList(
            itemBuilder: (context, index) {
              var element = context.watch<MyLists>().myLists.elementAt(index);
              return ListTile(
                key: ObjectKey(element),
                leading: const Icon(Icons.checklist_rounded),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.remove_rounded,
                    size: 18,
                  ),
                  onPressed: () {
                    context.read<MyLists>().removeAt(index);
                  },
                ),
                title: Text(element.key),
                onTap: () {},
              );
            },
            itemCount: context.watch<MyLists>().myLists.length,
            onReorder: (oldIndex, newIndex) {},
          ),
          SliverToBoxAdapter(
            child: Visibility(
              visible: context.watch<MyLists>().myLists.isNotEmpty,
              child: const Divider(
                indent: 16,
                endIndent: 16,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'My Groups',
                style: TextStyle(color: colorScheme.primary),
              ),
            ),
          ),
          //my groups
          SliverReorderableList(
            itemBuilder: (context, index) {
              var element = context.watch<MyGroups>().myGroups.elementAt(index);
              return ListTile(
                key: ObjectKey(element),
                leading: const Icon(Icons.folder_outlined),
                title: Text(element.key),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.expand_more_rounded),
                ),
              );
            },
            itemCount: context.watch<MyGroups>().myGroups.length,
            onReorder: (oldIndex, newIndex) {},
          ),
          const SliverToBoxAdapter(
            child: Divider(
              indent: 16,
              endIndent: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'Info',
                style: TextStyle(color: colorScheme.primary),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: ListTile(
              leading: Icon(Icons.policy_outlined),
              title: Text('Privacy policy'),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.article_outlined),
              title: const Text('License'),
              onTap: () => showLicensePage(
                  context: context,
                  applicationName: 'Tasks',),
            ),
          ),
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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel')),
                        TextButton(
                            onPressed: () {
                              bool added = context
                                  .read<MyLists>()
                                  .addList(MapEntry(listName, []));
                              if (added) Navigator.pop(context);
                            },
                            child: const Text('Save')),
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
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                bool added = context
                                    .read<MyGroups>()
                                    .addGroup(MapEntry(groupName, []));
                                if (added) Navigator.pop(context);
                              },
                              child: const Text('Save')),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.create_new_folder_outlined,
                color: colorScheme.primary,
              ))
        ]),
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