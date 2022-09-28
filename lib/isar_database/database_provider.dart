import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:isar/isar.dart';

import 'collections.dart';
import '../functions.dart';
import '../enums.dart';

class DatabaseProvider with ChangeNotifier {
  DatabaseProvider(this.localDatabase, this.tempDatabase) {
    initIsar();
    setCurrentDayAppBarTitle();
    FlutterNativeSplash.remove();
  }

  Isar localDatabase;
  Map<Collections, List<Object>> tempDatabase;

  late Widget homePageAppBarTitle;
  int activeGroupId = DefaultGroups.Main.index;
  int activeListId = DefaultLists.MyDay.index;

  void initIsar() async {
    //whether to create default groups
    int numGroups = tempDatabase.entries
        .where((element) => element.key == Collections.Groups)
        .first
        .value
        .length;
    if (numGroups == 0) {
      var defaultGroups = [
        Group(
          id: DefaultGroups.Main.index,
          name: DefaultGroups.Main.name,
        ),
        Group(
          id: DefaultGroups.Office.index,
          name: DefaultGroups.Office.name,
        ),
      ];
      tempDatabase.entries
          .where((element) => element.key == Collections.Groups)
          .first
          .value
          .addAll(defaultGroups);
      await localDatabase
          .writeTxn((isar) async => await isar.groups.putAll(defaultGroups));
    }

    //whether to create default lists
    int numLists = tempDatabase.entries
        .where((element) => element.key == Collections.TaskLists)
        .first
        .value
        .length;
    if (numLists == 0) {
      var defaultLists = [
        TaskList(
          groupId: DefaultGroups.Main.index,
          name: DefaultLists.MyDay.name,
          id: DefaultLists.MyDay.index,
        ),
        TaskList(
          groupId: DefaultGroups.Main.index,
          name: DefaultLists.Planned.name,
          id: DefaultLists.Planned.index,
        ),
        TaskList(
          groupId: DefaultGroups.Main.index,
          name: DefaultLists.Starred.name,
          id: DefaultLists.Starred.index,
        ),
        TaskList(
          groupId: DefaultGroups.Main.index,
          name: DefaultLists.Shopping.name,
          id: DefaultLists.Shopping.index,
        ),
        TaskList(
          groupId: DefaultGroups.Main.index,
          name: DefaultLists.Ideas.name,
          id: DefaultLists.Ideas.index,
        ),
        TaskList(
          groupId: DefaultGroups.Main.index,
          name: DefaultLists.Plans.name,
          id: DefaultLists.Plans.index,
        ),
      ];
      tempDatabase.entries
          .where((element) => element.key == Collections.TaskLists)
          .first
          .value
          .addAll(defaultLists);
      await localDatabase.writeTxn((isar) async {
        await isar.taskLists.putAll(defaultLists);
      });
    }
  }

  void setActiveGroupId(int id) {
    activeGroupId = id;
    notifyListeners();
  }

  void setActiveListId(int id) {
    activeListId = id;
    notifyListeners();
  }

  //work with app bar
  void setCurrentDayAppBarTitle() {
    homePageAppBarTitle = Builder(
      builder: (context) {
        ColorScheme colorScheme = Theme.of(context).colorScheme;
        DateTime currentDateTime = DateTime.now();
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
    notifyListeners();
  }

  void setCustomAppBarTitle(String title) {
    homePageAppBarTitle = Builder(
      builder: (context) {
        ColorScheme colorScheme = Theme.of(context).colorScheme;
        return Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: colorScheme.primary,
          ),
        );
      },
    );
    notifyListeners();
  }

  //database methods
  Future<void> addTask(Task task, List<Subtask> subtasks) async {
    tempDatabase.entries
        .singleWhere((element) => element.key == Collections.Tasks)
        .value
        .add(task);
    tempDatabase.entries
        .singleWhere((element) => element.key == Collections.Subtasks)
        .value
        .addAll(subtasks);
    await localDatabase.writeTxn((isar) async {
      await isar.tasks.put(task);
      await isar.subtasks.putAll(subtasks);
    });
    notifyListeners();
  }

  Future<void> updateTask(Task task, List<Subtask> subtasks) async {
    //task
    tempDatabase.entries
        .singleWhere((element) => element.key == Collections.Tasks)
        .value
        .removeWhere((element) {
      element = element as Task;
      return element.id == task.id;
    });
    tempDatabase.entries
        .singleWhere((element) => element.key == Collections.Tasks)
        .value
        .add(task);

    await localDatabase.writeTxn((isar) async {
      await isar.tasks.delete(task.id);
      await isar.tasks.put(task);
    });

    for (Subtask subtask in subtasks) {
      //subtasks
      tempDatabase.entries
          .singleWhere((element) => element.key == Collections.Subtasks)
          .value
          .removeWhere((element) {
        element = element as Subtask;
        return element.id == subtask.id;
      });
    }

    tempDatabase.entries
        .singleWhere((element) => element.key == Collections.Subtasks)
        .value
        .addAll(subtasks);

    await localDatabase.writeTxn((isar) async {
      await isar.subtasks.deleteAll(subtasks.map((e) => e.id).toList());
      await isar.subtasks.putAll(subtasks);
    });

    notifyListeners();
  }

  void deleteTask(Task task) {
    tempDatabase.entries
        .singleWhere((element) => element.key == Collections.Tasks)
        .value
        .remove(task);
    notifyListeners();
    localDatabase.writeTxn((isar) async => await isar.tasks.delete(task.id));
  }

  void updateTaskChecked(bool value, Task oldTask) {
    Task task = tempDatabase.entries
        .singleWhere((element) => element.key == Collections.Tasks)
        .value
        .singleWhere((element) {
      element = element as Task;
      return element.groupId == oldTask.groupId &&
          element.listId == oldTask.listId &&
          element.id == oldTask.id;
    }) as Task;
    task.isChecked = value;
    localDatabase.writeTxn((isar) async {
      await isar.tasks.delete(task.id);
      await isar.tasks.put(task);
    });
  }

  Future<void> addList(int listId, int groupId, String listName) async {
    var taskList = TaskList(id: listId, groupId: groupId, name: listName);
    tempDatabase.entries
        .singleWhere((element) => element.key == Collections.TaskLists)
        .value
        .add(taskList);
    notifyListeners();
    await localDatabase
        .writeTxn((isar) async => await isar.taskLists.put(taskList));
  }

  Future<void> removeList(TaskList taskList) async {
    tempDatabase.entries
        .singleWhere((element) => element.key == Collections.TaskLists)
        .value
        .remove(taskList);
    notifyListeners();
    await localDatabase.taskLists.delete(taskList.id);
  }
}
