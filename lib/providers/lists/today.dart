import 'dart:ui';

import 'package:flutter/material.dart';
import '../../data/algos.dart';
import '../../data/enums.dart';
import '../../data/models.dart';

class TodayList with ChangeNotifier {
  List<TaskModel> todayList = [];

  Widget appBarTitle(ColorScheme colorScheme) {
    var currentDateTime = DateTime.now();
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
  }

  void addToday(TaskModel taskModel) {
    todayList.add(taskModel);
    notifyListeners();
  }

  void updateToday(int index, TaskModel taskModel) {
    todayList[index] = taskModel;
    notifyListeners();
  }

  void removeToday(int index) {
    todayList.removeAt(index);
    notifyListeners();
  }
}
