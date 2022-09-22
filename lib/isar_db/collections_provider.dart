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
    int numGroups = await isar.groupss.count();
    if (numGroups == 0) {
      var mainGroup = Groups()..name = DefaultListGroup.main.name;
      var officeGroup = Groups()..name = DefaultListGroup.office.name;
      isar.writeTxn((isard) async {
        await isar.groupss.putAll([mainGroup, officeGroup]);
      });
    }

    //create default lists
    int numLists = await isar.listss.count();
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

      isar.writeTxn((isar) async {
        await isar.listss.putAll(defaultLists);
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

  //work with groups
  Stream<List<Groups>> getGroups() {
    return isar.groupss.filter().idGreaterThan(1).watch(initialReturn: true);
  }

  void addGroup(Groups group) async {
    await isar.writeTxn((isar) async => await isar.groupss.put(group));
  }

  void removeGroupAt(int groupId) async {
    await isar.writeTxn(
        (isar) async => isar.groupss.filter().idEqualTo(groupId).deleteAll());
  }

  //work with lists
  Stream<List<Lists>> getLists(int groupId) {
    return isar.listss
        .filter()
        .groupIdEqualTo(groupId)
        .watch(initialReturn: true);
  }

  void addList(Lists list) async {
    await isar.writeTxn((isar) async => await isar.listss.put(list));
  }

  void removeListAt(int groupId, int listId) async {
    isar.writeTxn((isar) async => await isar.listss
        .filter()
        .idEqualTo(listId)
        .and()
        .groupIdEqualTo(groupId)
        .deleteAll());
  }

  //work with tasks
  Stream<List<Tasks>> getTasks() {
    return isar.taskss
        .filter()
        .groupIdEqualTo(activeGroupId)
        .and()
        .listIdEqualTo(activeListId)
        .watch(initialReturn: true);
  }

  void updateTaskChecked(bool checkValue, int taskId) async {
    var task = await isar.taskss.get(taskId);
    task!.isChecked = checkValue;
    await isar.writeTxn((isar) async {
      await isar.taskss.filter().idEqualTo(taskId).deleteFirst();
      await isar.taskss.put(task);
    });
  }

  void updateTask(Tasks task) async {
    await isar.writeTxn((isar) async {
      await isar.taskss.filter().idEqualTo(task.id!).deleteFirst();
      await isar.taskss.put(task);
    });
  }

  void addTask(Tasks task) async {
    await isar.writeTxn((isar) async => await isar.taskss.put(task));
  }

  void removeTask(int taskId) async {
    await isar.writeTxn((isar) async => await isar.taskss.delete(taskId));
  }

  Future<int> getUniqueTaskId() async {
    var numTasks = await isar.taskss.count();
    if (numTasks == 0) {
      return 1;
    } else {
      var tasks = await isar.taskss.where().findAll();
      return tasks.last.id! + 1;
    }
  }

  //work with subtask
  Future<List<Subtasks>> getSubtasks(int taskId) async {
    return await isar.subtaskss
        .filter()
        .groupIdEqualTo(activeGroupId)
        .and()
        .listIdEqualTo(activeListId)
        .and()
        .taskIdEqualTo(taskId)
        .findAll();
  }

  void addSubtasks(int taskId, List<Subtasks> subtasks) async {
    await isar.writeTxn((isar) async {
      await isar.subtaskss
          .filter()
          .groupIdEqualTo(activeGroupId)
          .and()
          .listIdEqualTo(activeListId)
          .and()
          .taskIdEqualTo(taskId)
          .deleteAll();
      await isar.subtaskss.putAll(subtasks);
    });
  }
}
