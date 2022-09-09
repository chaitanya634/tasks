import 'package:flutter/material.dart';
import '../../data/models.dart';

class PlannedList with ChangeNotifier {
  List<TaskModel> plannedTasks = [];

  void addTask(TaskModel taskModel) {
    plannedTasks.add(taskModel);
    notifyListeners();
  }

  void updateTask(int index, TaskModel taskModel) {
    plannedTasks[index] = taskModel;
    notifyListeners();
  }

  void updateTaskChecked({required bool isChecked, required int taskIndex}) {
    plannedTasks.elementAt(taskIndex).isChecked = isChecked;
    notifyListeners();
  }

  void removeTask(int index) {
    plannedTasks.removeAt(index);
    notifyListeners();
  }
}
