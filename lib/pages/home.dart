import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/providers/task_lists.dart';
import '../data/algos.dart';
import '../data/enums.dart';
import '../pages/create_task.dart';
import '../providers/task_lists.dart';
import 'list_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget? appBarTitle;

  @override
  void initState() {
    super.initState();
    appBarTitle = Builder(
      builder: (context) {
        var currentDateTime = DateTime.now();
        var colorScheme = Theme.of(context).colorScheme;
        return Column(
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
                        fontFeatures: const [FontFeature.superscripts()])),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(Months.values[currentDateTime.month - 1].name,
                      style: TextStyle(
                        color: colorScheme.secondary,
                        fontSize: 10,
                      )),
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
    ColorScheme? colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: colorScheme.background,
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
                    childCount: context.watch<TaskLists>().planned.length,
                    (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            trailing: Checkbox(
                                checkColor: colorScheme.onPrimary,
                                activeColor: colorScheme.primary,
                                value: context
                                    .watch<TaskLists>()
                                    .planned
                                    .elementAt(index)
                                    .isChecked,
                                onChanged: (value) {
                                  var x = context.read<TaskLists>();
                                  x.updateChecked(x.planned, index, value!);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            title: Text(
                              context
                                  .watch<TaskLists>()
                                  .planned
                                  .elementAt(index)
                                  .title,
                              style: TextStyle(
                                  color: colorScheme.secondary, fontSize: 18),
                            ),
                            subtitle: generateSubtitle(context
                                .read<TaskLists>()
                                .planned
                                .elementAt(index)),
                            onTap: () {
                              showGeneralDialog(
                                context: context,
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return CreateTaskPage(
                                    taskModelIndex: index,
                                    colorScheme: colorScheme,
                                  );
                                },
                              );
                            },
                          ),
                          const Divider()
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: colorScheme.secondaryContainer,
        shape: const CircularNotchedRectangle(),
        child: Wrap(
          children: [
            IconButton(
                icon:
                    Icon(Icons.menu_rounded, color: colorScheme.inverseSurface),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: colorScheme.secondaryContainer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    builder: (context) => const ListMenu(),
                  );
                }),
            IconButton(
                icon: Icon(Icons.today, color: colorScheme.primary),
                onPressed: () {
                  setState(() {
                    appBarTitle = Builder(
                      builder: (context) {
                        var currentDateTime = DateTime.now();
                        var colorScheme = Theme.of(context).colorScheme;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                DaysOfWeek
                                    .values[currentDateTime.weekday - 1].name,
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
                                      Months.values[currentDateTime.month - 1]
                                          .name,
                                      style: TextStyle(
                                        color: colorScheme.secondary,
                                        fontSize: 10,
                                      )),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  });
                }),
            IconButton(
                icon: Icon(Icons.task_alt_rounded,
                    color: colorScheme.inverseSurface),
                onPressed: () {
                  setState(() {
                    appBarTitle = Text('Planned',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: colorScheme.primary));
                  });
                }),
            IconButton(
                icon: Icon(Icons.star_border_rounded,
                    color: colorScheme.inverseSurface),
                onPressed: () {
                  setState(() {
                    appBarTitle = Text('Starred',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: colorScheme.primary));
                  });
                }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 2.5,
        backgroundColor: colorScheme.primaryContainer,
        shape: const CircleBorder(),
        onPressed: () {
          showGeneralDialog(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) {
              return const CreateTaskPage();
            },
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
