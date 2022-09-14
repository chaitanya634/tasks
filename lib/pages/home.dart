import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/data/enums.dart';

import '../providers/lists_handler.dart';
import '../data/algos.dart';
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
          SliverAppBar(
            automaticallyImplyLeading: false,
            shadowColor: colorScheme.shadow,
            floating: true,
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: context.watch<ListsHandler>().appBarTitle,
              titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
              expandedTitleScale: 2,
            ),
            actions: [
              PopupMenuButton(
                icon: const Icon(
                    IconData(0xe813, fontFamily: 'OutlinedFontIcons')),
                itemBuilder: (context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                      child: ListTile(
                    title: Text('Creation'),
                  )),
                  const PopupMenuItem(
                      child: ListTile(
                    title: Text('Due date'),
                  )),
                  const PopupMenuItem(
                      child: ListTile(
                    title: Text('Starred'),
                  )),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                    IconData(0xe814, fontFamily: 'OutlinedFontIcons')),
              ),
              PopupMenuButton(
                icon: const Icon(
                    IconData(0xe815, fontFamily: 'OutlinedFontIcons')),
                itemBuilder: (context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                      child: ListTile(
                    title: Text('Reorder tasks'),
                  )),
                  const PopupMenuItem(
                      child: ListTile(
                    title: Text('Hide completed'),
                  )),
                  const PopupMenuItem(
                      child: ListTile(
                    title: Text('Print list'),
                  )),
                  const PopupMenuItem(
                      child: ListTile(
                    title: Text('Change theme'),
                  )),
                  const PopupMenuItem(
                      child: ListTile(
                    title: Text('Clear list'),
                  )),
                ],
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: context
                  .watch<ListsHandler>()
                  .taskListGroup
                  .singleWhere((element) =>
                      element.key ==
                      context.watch<ListsHandler>().activeGroupName)
                  .value
                  .singleWhere((element) =>
                      element.key ==
                      context.watch<ListsHandler>().activeListName)
                  .value
                  .length,
              (context, index) {
                var taskModel = context
                    .watch<ListsHandler>()
                    .taskListGroup
                    .singleWhere((element) =>
                        element.key ==
                        context.watch<ListsHandler>().activeGroupName)
                    .value
                    .singleWhere((element) =>
                        element.key ==
                        context.watch<ListsHandler>().activeListName)
                    .value
                    .elementAt(index);
                return Column(
                  children: [
                    ListTile(
                      minVerticalPadding: 18,
                      trailing: SizedBox(
                        height: double.infinity,
                        child: Checkbox(
                          checkColor: colorScheme.onPrimary,
                          activeColor: colorScheme.primary,
                          value: taskModel.isChecked,
                          onChanged: (value) {
                            context
                                .read<ListsHandler>()
                                .updateTaskChecked(value ?? false, index);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      title: Text(
                        taskModel.title ?? 'NO TITLE',
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: generateSubtitle(taskModel),
                      onTap: () {
                        // showGeneralDialog(
                        //   context: context,
                        //   pageBuilder:
                        //       (context, animation, secondaryAnimation) {
                        //     return CreateTaskPage(
                        //       taskIndex: index,
                        //       currentList: currentList!,
                        //     );
                        //   },
                        // );
                      },
                    ),
                    const Divider(height: 1),
                  ],
                );
              },
            ),
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
                context.watch<ListsHandler>().activeListName ==
                        DefaultLists.MyDay.name
                    ? Icons.today
                    : Icons.today_outlined,
                color: context.watch<ListsHandler>().activeListName ==
                        DefaultLists.MyDay.name
                    ? colorScheme.primary
                    : colorScheme.inverseSurface,
                size: 21,
              ),
              onPressed: () {
                context
                    .read<ListsHandler>()
                    .setActiveList(DefaultLists.MyDay.name);
                context.read<ListsHandler>().setCurrentDayTitle();
              },
            ),

            //Planned
            IconButton(
              icon: Icon(
                Icons.task_alt_rounded,
                color: context.watch<ListsHandler>().activeListName ==
                        DefaultLists.Planned.name
                    ? colorScheme.primary
                    : colorScheme.inverseSurface,
                size: 21,
              ),
              onPressed: () {
                context
                    .read<ListsHandler>()
                    .setCustomTitle(DefaultLists.Planned.name);
                context
                    .read<ListsHandler>()
                    .setActiveList(DefaultLists.Planned.name);
              },
            ),

            //Starred
            IconButton(
              icon: Icon(
                context.watch<ListsHandler>().activeListName ==
                        DefaultLists.Starred.name
                    ? Icons.star_rounded
                    : Icons.star_outline_rounded,
                color: context.watch<ListsHandler>().activeListName ==
                        DefaultLists.Starred.name
                    ? colorScheme.primary
                    : colorScheme.inverseSurface,
              ),
              onPressed: () {
                context
                    .read<ListsHandler>()
                    .setCustomTitle(DefaultLists.Starred.name);
                context
                    .read<ListsHandler>()
                    .setActiveList(DefaultLists.Starred.name);
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
          // showGeneralDialog(
          //   context: context,
          //   pageBuilder: (context, animation, secondaryAnimation) =>
          //       CreateTaskPage(currentList: currentList!),
          // );
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
