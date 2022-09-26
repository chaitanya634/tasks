import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'collections.dart';
import '../functions.dart';
import '../enums.dart';

class DatabaseProvider with ChangeNotifier {
  late Isar isar;
  late Widget homePageAppBarTitle;
  int activeGroupId = DefaultGroups.Main.index;
  int activeListId = DefaultLists.MyDay.index;

  DatabaseProvider(this.isar) {
    initIsar();
    setCurrentDayAppBarTitle();
  }

  void initIsar() async {
    //delete all data from database
    // await isar.writeTxn((isar) => isar.clear()); //TODO: comment this statement

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

  Future<List<TaskList>> fetchTaskListCollection() =>
      isar.taskLists.where().findAll();

  Future<List<Group>> fetchGroupCollection() => isar.groups.where().findAll();

  //temporary data
  //required to avoid read write delay
  late List<TaskList> tempTaskListCollection;
  late List<Group> tempGroupCollection;

  void replaceGroupsCollection() async {
    await isar.writeTxn((isar) async {
      await isar.groups.clear();
      await isar.groups.putAll(tempGroupCollection);
    });
  }

  void replaceTaskListCollection() async {
    await isar.writeTxn((isar) async {
      await isar.taskLists.clear();
      await isar.taskLists.putAll(tempTaskListCollection);
    });
  }

  void initTempTaskListCollection(List<TaskList> taskListCollection) =>
      tempTaskListCollection = taskListCollection;

  void initTempGroupCollection(List<Group> groupCollection) =>
      tempGroupCollection = groupCollection;

  int tempTaskListId() => tempTaskListCollection.last.id + 1;

  int tempGroupId() => tempGroupCollection.last.id + 1;

  bool addTempGroup(Group group) {
    tempGroupCollection.add(group);
    notifyListeners();
    return tempGroupCollection.contains(group);
  }

  bool addTempTaskList(TaskList taskList) {
    tempTaskListCollection.add(taskList);
    notifyListeners();
    return tempTaskListCollection.contains(taskList);
  }

  void deleteTempTaskList(TaskList taskList) {
    tempTaskListCollection.remove(taskList);
    notifyListeners();
  }

  void deleteTempGroup(Group group) {
    tempGroupCollection.remove(group);
    notifyListeners();
  }
}
