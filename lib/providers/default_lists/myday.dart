import 'package:flutter/material.dart';
import '../../data/models.dart';

class MyDayList with ChangeNotifier {
  List<TaskModel> myDayTasks = [];

  void addTask(TaskModel taskModel) {
    myDayTasks.add(taskModel);
    notifyListeners();
  }

  void updateTaskChecked({required bool isChecked, required int taskIndex}) {
    myDayTasks.elementAt(taskIndex).isChecked = isChecked;
    notifyListeners();
  }

  void removeStarred(TaskModel taskModel) {
    taskModel.isStarred = false;
    notifyListeners();
  }

  void updateTask(int index, TaskModel taskModel) {
    myDayTasks[index] = taskModel;
    notifyListeners();
  }

  void removeTask(int index) {
    myDayTasks.removeAt(index);
    notifyListeners();
  }

  void removeTaskModel(TaskModel taskModel) {
    myDayTasks.remove(taskModel);
    notifyListeners();
  }

}
