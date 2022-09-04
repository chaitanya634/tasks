import 'package:flutter/foundation.dart';

class SubtaskModel {
  String? title;
  bool isChecked = false;
}

class MyData with ChangeNotifier, SubtaskModel {
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
