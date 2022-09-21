  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:tasks/data/enums.dart';

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
            //   SliverList(
            //       delegate: SliverChildBuilderDelegate(
            //     childCount: context
            //             .watch<ListsHandler>()
            //             .taskListGroup
            //             .singleWhere((element) =>
            //                 element.key == DefaultListGroup.main.name)
            //             .value
            //             .length -
            //         3,
            //     (context, index) {
            //       var element = context
            //           .watch<ListsHandler>()
            //           .taskListGroup
            //           .singleWhere(
            //               (element) => element.key == DefaultListGroup.main.name)
            //           .value
            //           .elementAt(index + 3);
            //       return ListTile(
            //         leading: const Icon(Icons.checklist_rounded),
            //         trailing: IconButton(
            //           icon: const Icon(
            //             Icons.remove_rounded,
            //             size: 18,
            //           ),
            //           onPressed: () {
            //             context
            //                 .read<ListsHandler>()
            //                 .setActiveList(DefaultLists.MyDay.name);
            //             context.read<ListsHandler>().setCurrentDayTitle();
            //             context.read<ListsHandler>().removeListAt(0, index + 3);
            //           },
            //         ),
            //         title: Text(element.key),
            //         onTap: () {
            //           context
            //               .read<ListsHandler>()
            //               .setActiveGroup(DefaultListGroup.main.name);
            //           context.read<ListsHandler>().setCustomTitle(element.key);
            //           context.read<ListsHandler>().setActiveList(element.key);
            //           Navigator.pop(context);
            //         },
            //       );
            //     },
            //   )),
            // SliverToBoxAdapter(
            //   child: Visibility(
            //     visible: context
            //             .watch<ListsHandler>()
            //             .taskListGroup
            //             .singleWhere((element) =>
            //                 element.key == DefaultListGroup.main.name)
            //             .value
            //             .length >
            //         3,
            //     child: const Divider(indent: 16, endIndent: 16),
            //   ),
            // ),

            SliverToBoxAdapter(
              child: ListTile(
                title: Text(
                  'My Groups',
                  style: TextStyle(color: colorScheme.primary),
                ),
              ),
            ),

              //my groups
            //   SliverList(
            //       delegate: SliverChildBuilderDelegate(
            //     childCount:
            //         context.watch<ListsHandler>().taskListGroup.length - 1,
            //     (context, index) {
            //       var element = context
            //           .watch<ListsHandler>()
            //           .taskListGroup
            //           .elementAt(index + 1);
            //       return ListTile(
            //         leading: const Icon(Icons.folder_outlined),
            //         title: Text(element.key),
            //         trailing: IconButton(
            //             onPressed: () {
            //               context.read<ListsHandler>().removeGroupAt(index + 1);
            //             },
            //             icon: const Icon(
            //               Icons.remove_rounded,
            //               size: 18,
            //             )),
            //         onTap: () {
            //           showModalBottomSheet(
            //               shape: const RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.only(
            //                 topLeft: Radius.circular(16),
            //                 topRight: Radius.circular(16),
            //               )),
            //               context: context,
            //               builder: (context) => TaskGroup(
            //                     groupIndex: index + 1,
            //                   ));
            //         },
            //       );
            //     },
            //   )),
            // if (context.watch<ListsHandler>().taskListGroup.length > 1)
            //   const SliverToBoxAdapter(child: Divider(indent: 16, endIndent: 16)),
            
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
                            // TextButton(
                            //   child: const Text('Save'),
                            //   onPressed: () {
                            //     context
                            //         .read<ListsHandler>()
                            //         .addList(0, MapEntry(listName, []));
                            //     Navigator.pop(context);
                            //   },
                            // ),
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
                        // ignore: unused_local_variable
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
                            // TextButton(
                            //     onPressed: () {
                            //       context
                            //           .read<ListsHandler>()
                            //           .addGroup(groupName);
                            //       Navigator.pop(context);
                            //     },
                            //     child: const Text('Save')),
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