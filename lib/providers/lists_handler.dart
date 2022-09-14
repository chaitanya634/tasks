import 'package:flutter/material.dart';

import '../data/models.dart';
import '../data/algos.dart';
import '../data/enums.dart';

import 'dart:ui';

class ListsHandler with ChangeNotifier {
  late List<MapEntry<String, List<TaskModel>>> taskLists;
  late String activeListName;
  late Widget appBarTitle;

  ListsHandler() {
    Map<String, List<TaskModel>> defaultLists = {
      DefaultLists.MyDay.name: [],
      DefaultLists.Planned.name: [],
      DefaultLists.Starred.name: [],
    };

    taskLists = [];
    taskLists.addAll(defaultLists.entries);

    activeListName = DefaultLists.MyDay.name;
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

  //working on lists
  bool addList(MapEntry<String, List<TaskModel>> listMap) {
    taskLists.add(listMap);
    notifyListeners();
    return taskLists.contains(listMap);
  }

  void removeListAt(int index) {
    taskLists.removeAt(index);
    notifyListeners();
  }

  void setActiveList(String listKey) {
    activeListName = listKey;
    notifyListeners();
  }

  //working on tasks
  void updateTaskChecked(bool checkValue, int taskModelIndex) {
    taskLists
        .singleWhere((element) => element.key == activeListName)
        .value
        .elementAt(taskModelIndex)
        .isChecked = checkValue;
    notifyListeners();
  }
}
