import 'package:flutter/material.dart';
import '../../data/models.dart';

class StarredList with ChangeNotifier {
  List<TaskModel> starredList = [];

  void addStarred(TaskModel taskModel) {
    starredList.add(taskModel);
    notifyListeners();
  }

  void updateStarred(int index, TaskModel taskModel) {
    starredList[index] = taskModel;
    notifyListeners();
  }

  void removeStarred(int index) {
    starredList.removeAt(index);
    notifyListeners();
  }
}
