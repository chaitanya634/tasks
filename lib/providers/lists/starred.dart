import 'package:flutter/material.dart';
import '../../data/models.dart';

class StarredList with ChangeNotifier {
  List<TaskModel> starredTasks = [];

  void addTask(TaskModel taskModel) {
    starredTasks.add(taskModel);
    notifyListeners();
  }

  void updateTaskChecked({required bool isChecked, required int taskIndex}) {
    starredTasks.elementAt(taskIndex).isChecked = isChecked;
    notifyListeners();
  }

  void updateTask(int index, TaskModel taskModel) {
    starredTasks[index] = taskModel;
    notifyListeners();
  }

  void removeTask(int index) {
    starredTasks.removeAt(index);
    notifyListeners();
  }

  void removeTaskModel(TaskModel taskModel) {
    starredTasks.remove(taskModel);
    notifyListeners();
  }

}
