import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums.dart';
import '../functions.dart';
import '../isar_database/collections.dart';
import '../isar_database/database_provider.dart';
import 'display_task.dart';

Widget tasksOfList(BuildContext context, ColorScheme colorScheme,
    {bool onDesktop = false}) {
  return CustomScrollView(
    slivers: [
      //app bar
      SliverAppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        expandedHeight: 116.0,
        flexibleSpace: FlexibleSpaceBar(
          title: context.select<DatabaseProvider, Widget>(
            (value) => value.homePageAppBarTitle,
          ),
          titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
          expandedTitleScale: 2,
        ),
      ),
      //tasks list
      Builder(builder: (context) {
        var watchProvider = context.watch<DatabaseProvider>();
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: watchProvider.tempDatabase.entries
                .singleWhere((element) => element.key == Collections.Tasks)
                .value
                .where((element) {
              var task = element as Task;
              if (watchProvider.activeListId == DefaultLists.Planned.index) {
                return true;
              } else if (watchProvider.activeListId ==
                  DefaultLists.Starred.index) {
                return task.isStarred == true;
              } else if (watchProvider.activeListId ==
                  DefaultLists.MyDay.index) {
                var now = DateTime.now();
                //TODO: implement myday
                return task.listId == watchProvider.activeListId ||
                    task.repeat == RepeatTask.Daily.index ||
                    (task.due?.day == now.day &&
                        task.due?.month == now.month &&
                        task.due?.year == now.year) ||
                    (task.remainder?.day == now.day &&
                        task.remainder?.month == now.month &&
                        task.remainder?.year == now.year);
              }
              return task.groupId == watchProvider.activeGroupId &&
                  task.listId == watchProvider.activeListId;
            }).length,
            (context, index) {
              late Task task;
              if (watchProvider.activeListId == DefaultLists.Planned.index) {
                task = watchProvider.tempDatabase.entries
                    .singleWhere((element) => element.key == Collections.Tasks)
                    .value
                    .elementAt(index) as Task;
              } else if (watchProvider.activeListId ==
                  DefaultLists.Starred.index) {
                task = watchProvider.tempDatabase.entries
                    .singleWhere((element) => element.key == Collections.Tasks)
                    .value
                    .where((element) {
                  element = element as Task;
                  return element.isStarred == true;
                }).elementAt(index) as Task;
              } else if (watchProvider.activeListId ==
                  DefaultLists.MyDay.index) {
                task = watchProvider.tempDatabase.entries
                    .singleWhere((element) => element.key == Collections.Tasks)
                    .value
                    .where((element) {
                  element = element as Task;
                  var now = DateTime.now();
                  //TODO: implement myday
                  return element.listId == watchProvider.activeListId ||
                      element.repeat == RepeatTask.Daily.index ||
                      (element.due?.day == now.day &&
                          element.due?.month == now.month &&
                          element.due?.year == now.year) ||
                      (element.remainder?.day == now.day &&
                          element.remainder?.month == now.month &&
                          element.remainder?.year == now.year);
                }).elementAt(index) as Task;
              } else {
                task = watchProvider.tempDatabase.entries
                    .singleWhere((element) => element.key == Collections.Tasks)
                    .value
                    .where((element) {
                  var task = element as Task;
                  return task.groupId == watchProvider.activeGroupId &&
                      task.listId == watchProvider.activeListId;
                }).elementAt(index) as Task;
              }
              return Column(
                children: [
                  StatefulBuilder(
                    builder: (context, setState) {
                      return OpenContainer(
                        closedColor: onDesktop
                            ? colorScheme.surface
                            : colorScheme.background,
                        openColor: colorScheme.background,
                        transitionDuration: const Duration(milliseconds: 600),
                        openBuilder: (context, action) =>
                            DisplayTask(colorScheme, task: task),
                        closedBuilder: (context, action) => ListTile(
                          minVerticalPadding: 18,
                          trailing: SizedBox(
                            height: double.infinity,
                            child: Checkbox(
                              checkColor: colorScheme.onSecondary,
                              fillColor: MaterialStateProperty.resolveWith(
                                (states) {
                                  if (states.any((element) =>
                                      element == MaterialState.selected)) {
                                    return colorScheme.secondary;
                                  }
                                  return colorScheme.onBackground;
                                },
                              ),
                              value: task.isChecked,
                              onChanged: (value) {
                                setState(() {
                                  task.isChecked = value!;
                                });
                                context
                                    .read<DatabaseProvider>()
                                    .updateTaskChecked(value!, task);
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
                          subtitle: generateSubtitle(task, colorScheme),
                          onTap: action,
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                ],
              );
            },
          ),
        );
      })
    ],
  );
}
