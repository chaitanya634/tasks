import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../data/algos.dart';
import '../data/enums.dart';
import 'collections.dart';

class CollectionsProvider with ChangeNotifier {
  late Isar isar;
  late Widget homePageAppBarTitle;
  int activeGroupId = 1;
  int activeListId = 1;

  CollectionsProvider(this.isar) {
    initIsar();
    setCurrentDayAppBarTitle();
  }

  void initIsar() async {
    //create default groups
    int numGroups = await isar.groups.count();
    if (numGroups == 0) {
      var mainGroup = Groups()..name = DefaultListGroup.main.name;
      var officeGroup = Groups()..name = DefaultListGroup.office.name;
      isar.writeTxn(() async {
        var groupsId = await isar.groups.putAll([mainGroup, officeGroup]);
        activeGroupId = groupsId.elementAt(0);
      });
    }

    //create default lists
    int numLists = await isar.lists.count();
    if (numLists == 0) {
      var defaultLists = [
        Lists()
          ..groupId = activeGroupId
          ..name = DefaultLists.myDay.name,
        Lists()
          ..groupId = activeGroupId
          ..name = DefaultLists.planned.name,
        Lists()
          ..groupId = activeGroupId
          ..name = DefaultLists.starred.name,
        Lists()
          ..groupId = activeGroupId
          ..name = DefaultLists.shopping.name,
        Lists()
          ..groupId = activeGroupId
          ..name = DefaultLists.ideas.name,
        Lists()
          ..groupId = activeGroupId
          ..name = DefaultLists.plans.name,
      ];

      isar.writeTxn(() async {
        var listsId = await isar.lists.putAll(defaultLists);
        activeListId = listsId.elementAt(0);

        //test--
        isar.tasks.put(
          Tasks()
            ..groupId = activeGroupId
            ..listId = activeListId
            ..title = 'task 1'
            ..isStarred = true
            ..isChecked = true
            ..remainder = DateTime.now()
            ..due = DateTime.now()
            ..repeat = RepeatTask.Daily.index
            ..note = 'test task',
        );
      });
    }
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

  //work with tasks
  Stream<List<Tasks>> getTasks() {
    return isar.tasks
        .filter()
        .groupIdEqualTo(activeGroupId)
        .and()
        .listIdEqualTo(activeListId)
        .watch(fireImmediately: true);
  }

  void updateTaskChecked(bool checkValue, int taskId) async {
    var task = await isar.tasks.get(taskId);
    task!.isChecked = checkValue;
    await isar.writeTxn(() async {
      await isar.tasks.filter().idEqualTo(taskId).deleteFirst();
      await isar.tasks.put(task);
    });
  }

  void updateTask(Tasks task) async {
    await isar.writeTxn(() async {
      await isar.tasks.filter().idEqualTo(task.id).deleteFirst();
      await isar.tasks.put(task);
    });
  }

  void addTask(Tasks task) async {
    await isar.writeTxn(() async => await isar.tasks.put(task));
  }

  void removeTask(int taskId) async {
    await isar.writeTxn(() async => await isar.tasks.delete(taskId));
  }

  //work with subtask
  void addSubtask(Subtasks subtask) async {
    await isar.writeTxn(() async => await isar.subtasks.put(subtask));
  }
}
