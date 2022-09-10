import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/algos.dart';
import '../data/enums.dart';
import '../data/models.dart';

import '../pages/create_task.dart';
import '../pages/bottom_app_bar_menu.dart';

import '../providers/lists/myday.dart';
import '../providers/lists/planned.dart';
import '../providers/lists/starred.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DefaultLists currentList;
  late Widget appBarTitle;

  @override
  void initState() {
    super.initState();

    DateTime currentDateTime = DateTime.now();

    currentList = DefaultLists.MyDay;
    appBarTitle = Builder(
      builder: (context) {
        ColorScheme colorScheme = Theme.of(context).colorScheme;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            Text(
              DaysOfWeek.values[currentDateTime.weekday - 1].name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: colorScheme.primary,
              ),
            ),
            //Subtitle
            Wrap(
              children: [
                Text(
                  currentDateTime.day.toString(),
                  style: TextStyle(
                    color: colorScheme.secondary,
                    fontSize: 10,
                  ),
                ),
                Text(
                  ordinal(currentDateTime.day),
                  style: TextStyle(
                    color: colorScheme.secondary,
                    fontSize: 6,
                    fontFeatures: const [FontFeature.superscripts()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    Months.values[currentDateTime.month - 1].name,
                    style: TextStyle(
                      color: colorScheme.secondary,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    late int currentListChildCount;

    switch (currentList) {
      case DefaultLists.MyDay:
        currentListChildCount = context.watch<MyDayList>().myDayTasks.length;
        break;
      case DefaultLists.Planned:
        currentListChildCount =
            context.watch<PlannedList>().plannedTasks.length;
        break;
      case DefaultLists.Starred:
        currentListChildCount =
            context.watch<StarredList>().starredTasks.length;
        break;
    }

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // backgroundColor: colorScheme.background,
            shadowColor: colorScheme.shadow,
            floating: true,
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: appBarTitle,
              titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
              expandedTitleScale: 2,
            ),
            actions: [
              PopupMenuButton(
                color: colorScheme.secondaryContainer,
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
                color: colorScheme.secondaryContainer,
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
                ],
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: currentListChildCount,
              (context, index) {
                late bool isTaskChecked;
                late String taskTitle;
                late TaskModel taskSubtitle;
                switch (currentList) {
                  case DefaultLists.MyDay:
                    isTaskChecked = context
                        .watch<MyDayList>()
                        .myDayTasks
                        .elementAt(index)
                        .isChecked;
                    taskTitle = context
                        .watch<MyDayList>()
                        .myDayTasks
                        .elementAt(index)
                        .title!;
                    taskSubtitle =
                        context.watch<MyDayList>().myDayTasks.elementAt(index);
                    break;
                  case DefaultLists.Planned:
                    isTaskChecked = context
                        .watch<PlannedList>()
                        .plannedTasks
                        .elementAt(index)
                        .isChecked;
                    taskTitle = context
                        .watch<PlannedList>()
                        .plannedTasks
                        .elementAt(index)
                        .title!;
                    taskSubtitle = context
                        .watch<PlannedList>()
                        .plannedTasks
                        .elementAt(index);
                    break;
                  case DefaultLists.Starred:
                    isTaskChecked = context
                        .watch<StarredList>()
                        .starredTasks
                        .elementAt(index)
                        .isChecked;
                    taskTitle = context
                        .watch<StarredList>()
                        .starredTasks
                        .elementAt(index)
                        .title!;
                    taskSubtitle = context
                        .watch<StarredList>()
                        .starredTasks
                        .elementAt(index);
                    break;
                }
                return Column(
                  children: [
                    ListTile(
                      trailing: Checkbox(
                        checkColor: colorScheme.onPrimary,
                        activeColor: colorScheme.primary,
                        value: isTaskChecked,
                        onChanged: (value) {
                          switch (currentList) {
                            case DefaultLists.MyDay:
                              context.read<MyDayList>().updateTaskChecked(
                                    isChecked: value!,
                                    taskIndex: index,
                                  );
                              break;
                            case DefaultLists.Planned:
                              context.read<PlannedList>().updateTaskChecked(
                                    isChecked: value!,
                                    taskIndex: index,
                                  );
                              break;
                            case DefaultLists.Starred:
                              context.read<StarredList>().updateTaskChecked(
                                    isChecked: value!,
                                    taskIndex: index,
                                  );
                              break;
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      title: Text(
                        taskTitle,
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: generateSubtitle(taskSubtitle),
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return CreateTaskPage(
                              editTaskIndex: index,
                              currentList: currentList,
                            );
                          },
                        );
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: colorScheme.secondaryContainer,
        shape: const CircularNotchedRectangle(),
        child: Wrap(
          children: [
            //Menu
            IconButton(
              icon: Icon(Icons.menu_rounded, color: colorScheme.inverseSurface),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: colorScheme.secondaryContainer,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  builder: (context) => const BottomAppBarMenu(),
                );
              },
            ),

            //MyDay
            IconButton(
              icon: Icon(
                currentList == DefaultLists.MyDay
                    ? Icons.today
                    : Icons.today_outlined,
                color: currentList == DefaultLists.MyDay
                    ? colorScheme.primary
                    : colorScheme.inverseSurface,
              ),
              onPressed: () {
                DateTime currentDateTime = DateTime.now();
                setState(() {
                  currentList = DefaultLists.MyDay;
                  appBarTitle = Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DaysOfWeek.values[currentDateTime.weekday - 1].name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: colorScheme.primary)),
                      Wrap(
                        children: [
                          Text(currentDateTime.day.toString(),
                              style: TextStyle(
                                color: colorScheme.secondary,
                                fontSize: 10,
                              )),
                          Text(ordinal(currentDateTime.day),
                              style: TextStyle(
                                  color: colorScheme.secondary,
                                  fontSize: 6,
                                  fontFeatures: const [
                                    FontFeature.superscripts()
                                  ])),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Text(
                                Months.values[currentDateTime.month - 1].name,
                                style: TextStyle(
                                  color: colorScheme.secondary,
                                  fontSize: 10,
                                )),
                          ),
                        ],
                      ),
                    ],
                  );
                });
              },
            ),

            //Planned
            IconButton(
              icon: Icon(
                Icons.task_alt_rounded,
                color: currentList == DefaultLists.Planned
                    ? colorScheme.primary
                    : colorScheme.inverseSurface,
              ),
              onPressed: () {
                setState(() {
                  currentList = DefaultLists.Planned;
                  appBarTitle = Text(
                    'Planned',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: colorScheme.primary,
                    ),
                  );
                });
              },
            ),

            //Starred
            IconButton(
              icon: Icon(
                currentList == DefaultLists.Starred
                    ? Icons.star_rounded
                    : Icons.star_outline_rounded,
                color: currentList == DefaultLists.Starred
                    ? colorScheme.primary
                    : colorScheme.inverseSurface,
              ),
              onPressed: () {
                setState(() {
                  currentList = DefaultLists.Starred;
                  appBarTitle = Text(
                    'Starred',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: colorScheme.primary,
                    ),
                  );
                });
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
                CreateTaskPage(currentList: currentList),
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
