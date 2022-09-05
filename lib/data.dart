import 'package:flutter/foundation.dart';

class SubtaskModel {
  String? title;
  bool isChecked;

  SubtaskModel({this.title, this.isChecked = false});
}


class TaskModel {
  bool isStarred = false;
  bool isChecked = false;
  String? title;

  List<SubtaskModel> subtasks = [];
}

class MyData with ChangeNotifier {
  List<SubtaskModel> subtasks = [];

  void addSubtask({required SubtaskModel subtaskModel}) {
    subtasks.add(subtaskModel);
    notifyListeners();
  }

  void removeSubtaskAt({required int index}) {
    subtasks.removeAt(index);
    notifyListeners();
  }

  void updateSubtaskTitle(String subtitle, int index) {
    subtasks.elementAt(index).title = subtitle;
    notifyListeners();
  }

  void updateSubtaskCheckbox(bool value, int index) {
    subtasks.elementAt(index).isChecked = value;
    notifyListeners();
  }
}
