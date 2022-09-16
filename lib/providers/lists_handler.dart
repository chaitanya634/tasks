import 'package:flutter/material.dart';

import '../data/models.dart';
import '../data/algos.dart';
import '../data/enums.dart';

import 'dart:ui';

class ListsHandler with ChangeNotifier {
  late List<MapEntry<String, List<MapEntry<String, List<TaskModel>>>>>
      taskListGroup;
  late String activeGroupName;
  late String activeListName;
  late Widget appBarTitle;

  ListsHandler() {
    List<MapEntry<String, List<TaskModel>>> defaultLists = [
      MapEntry(DefaultLists.MyDay.name, []),
      MapEntry(DefaultLists.Planned.name, []),
      MapEntry(DefaultLists.Starred.name, []),
      MapEntry(DefaultLists.Shopping.name, []),
      MapEntry(DefaultLists.Plans.name, []),
      MapEntry(DefaultLists.Ideas.name, []),
    ];

    taskListGroup = [];
    taskListGroup.add(MapEntry(DefaultListGroup.main.name, defaultLists));
    taskListGroup.add(MapEntry(DefaultListGroup.Office.name, []));

    activeListName = DefaultLists.MyDay.name;
    activeGroupName = DefaultListGroup.main.name;
    setCurrentDayTitle();
  }

  //set app bar title
  void setCurrentDayTitle() {
    appBarTitle = Builder(
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

  void setCustomTitle(String title) {
    appBarTitle = Builder(
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

  //working on groups
  void addGroup(String groupName) {
    taskListGroup.add(MapEntry(groupName, []));
    notifyListeners();
  }
  void removeGroupAt(int index){
    taskListGroup.removeAt(index);
    notifyListeners();
  }

  void setActiveGroup(String groupName) {
    activeGroupName = groupName;
    notifyListeners();
  }

//working on list
  void addList(
      int groupIndex, MapEntry<String, List<TaskModel>> newTaskList) {
    taskListGroup.elementAt(groupIndex).value.add(newTaskList);
    notifyListeners();
  }

  void removeListAt(String groupName, int index) {
    taskListGroup
        .singleWhere((element) => element.key == groupName)
        .value
        .removeAt(index);
    notifyListeners();
  }

  void setActiveList(String listName) {
    activeListName = listName;
    notifyListeners();
  }

  //working on tasks
  void updateTaskChecked(bool checkValue, int taskModelIndex) {
    taskListGroup
        .singleWhere((element) => element.key == activeGroupName)
        .value
        .singleWhere((element) => element.key == activeListName)
        .value
        .elementAt(taskModelIndex)
        .isChecked = checkValue;
    notifyListeners();
  }

  void addTask(TaskModel taskModel) {
    taskListGroup
        .singleWhere((element) => element.key == activeGroupName)
        .value
        .singleWhere((element) => element.key == activeListName)
        .value
        .add(taskModel);
    notifyListeners();
  }

  void updateTask(int index, TaskModel taskModel) {
    taskListGroup
        .singleWhere((element) => element.key == activeGroupName)
        .value
        .singleWhere((element) => element.key == activeListName)
        .value[index] = taskModel;
    notifyListeners();
  }

  void removeTask(TaskModel taskModel) {
    taskListGroup
        .singleWhere((element) => element.key == activeGroupName)
        .value
        .singleWhere((element) => element.key == activeListName)
        .value
        .remove(taskModel);
    notifyListeners();
  }

  void removeTaskAt(int index) {
    taskListGroup
        .singleWhere((element) => element.key == activeGroupName)
        .value
        .singleWhere((element) => element.key == activeListName)
        .value
        .removeAt(index);
    notifyListeners();
  }
}
