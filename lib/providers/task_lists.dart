import 'package:flutter/foundation.dart';
import 'package:tasks/data/models.dart';

class TaskLists with ChangeNotifier {
  List<TaskModel> planned = [];
  List<TaskModel> myDay = [];
  List<TaskModel> starred = [];

  void updateChecked(List<TaskModel> list, int index, bool value) {
    list.elementAt(index).isChecked = value;
    notifyListeners();
  }

  void updatePlanned(int index, TaskModel taskModel) {
    planned[index] = taskModel;
    notifyListeners();
  }

  void addPlanned(TaskModel taskModel) {
    planned.add(taskModel);
    notifyListeners();
  }

  void removePlanned(int index) {
    planned.removeAt(index);
    notifyListeners();
  }
}
