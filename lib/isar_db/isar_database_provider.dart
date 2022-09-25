import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'collections.dart';
import '../data/algos.dart';
import '../data/enums.dart';

class IsarDatabase with ChangeNotifier {
  late Isar isar;
  late Widget homePageAppBarTitle;
  int activeGroupId = DefaultGroups.Main.index;
  int activeListId = DefaultLists.MyDay.index;

  IsarDatabase(this.isar) {
    initIsar();
    setCurrentDayAppBarTitle();
  }

  void initIsar() async {
    // await isar.writeTxn((isar) => isar.clear());

    // create default groups
    int numGroups = await isar.groups.count();
    if (numGroups == 0) {
      isar.writeTxn((isar) async {
        await isar.groups.putAll([
          Group(
            id: DefaultGroups.Main.index,
            name: DefaultGroups.Main.name,
          ),
          Group(
            id: DefaultGroups.Office.index,
            name: DefaultGroups.Office.name,
          ),
        ]);
      });
    }

    //create default lists
    int numLists = await isar.taskLists.count();
    if (numLists == 0) {
      isar.writeTxn((isar) async {
        await isar.taskLists.putAll([
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
        ]);
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
  Stream<List<Group>> getGroups() {
    return isar.groups.filter().idGreaterThan(0).watch(initialReturn: true);
  }

  void addGroup(Group group) async {
    await isar.writeTxn((isar) async => await isar.groups.put(group));
  }

  void removeGroupAt(int groupId) async {
    await isar.writeTxn(
      (isar) async => isar.groups.filter().idEqualTo(groupId).deleteAll(),
    );
  }

  //work with lists
  Stream<List<TaskList>> getLists(int groupId) {
    return isar.taskLists
        .filter()
        .groupIdEqualTo(groupId)
        .watch(initialReturn: true);
  }

  void addList(TaskList list) async {
    await isar.writeTxn((isar) async => await isar.taskLists.put(list));
  }

  void removeListAt(int groupId, int listId) async {
    isar.writeTxn((isar) async => await isar.taskLists
        .filter()
        .idEqualTo(listId)
        .and()
        .groupIdEqualTo(groupId)
        .deleteAll());
  }

  //work with tasks
  Stream<List<Task>> getTasks() {
    return isar.tasks
        .filter()
        .groupIdEqualTo(activeGroupId)
        .and()
        .listIdEqualTo(activeListId)
        .watch(initialReturn: true);
  }

  void updateTaskChecked(bool checkValue, int taskId) async {
    var task = await isar.tasks.get(taskId);
    task!.isChecked = checkValue;
    await isar.writeTxn((isar) async {
      await isar.tasks.filter().idEqualTo(taskId).deleteFirst();
      await isar.tasks.put(task);
    });
  }

  void updateTask(Task task) async {
    await isar.writeTxn((isar) async {
      await isar.tasks.filter().idEqualTo(task.id!).deleteFirst();
      await isar.tasks.put(task);
    });
  }

  void addTask(Task task) async {
    await isar.writeTxn((isar) async => await isar.tasks.put(task));
  }

  void removeTask(int taskId) async {
    await isar.writeTxn((isar) async => await isar.tasks.delete(taskId));
  }

  Future<int> getUniqueTaskId() async {
    var numTasks = await isar.tasks.count();
    if (numTasks == 0) {
      return 1;
    } else {
      var tasks = await isar.tasks.where().findAll();
      return tasks.last.id! + 1;
    }
  }

  //work with subtask
  Future<List<Subtask>> getSubtasks(int taskId) async {
    return await isar.subtasks
        .filter()
        .groupIdEqualTo(activeGroupId)
        .and()
        .listIdEqualTo(activeListId)
        .and()
        .taskIdEqualTo(taskId)
        .findAll();
  }

  void addSubtasks(int taskId, List<Subtask> subtasks) async {
    await isar.writeTxn((isar) async {
      await isar.subtasks
          .filter()
          .groupIdEqualTo(activeGroupId)
          .and()
          .listIdEqualTo(activeListId)
          .and()
          .taskIdEqualTo(taskId)
          .deleteAll();
      await isar.subtasks.putAll(subtasks);
    });
  }
}
