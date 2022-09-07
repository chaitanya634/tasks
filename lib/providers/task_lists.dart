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
    // for (var x in planned) {
    //   debugPrint('ITEM: ${planned.indexOf(x)}');

    //   debugPrint('Task, isStarred: ${x.isStarred}');
    //   debugPrint('Task, isTitle: ${x.title}');
    //   debugPrint('Task, isChecked: ${x.isChecked}');

    //   if (x.subtasks != null) {
    //     debugPrint('SUBTASK:');
    //     for (var y in x.subtasks!) {
    //       debugPrint('Subtask, Title: ${y.title}');
    //       debugPrint('Subtask, isChecked: ${y.isChecked}');
    //     }
    //   }

    //   debugPrint('Task, remainder date: ${x.remainderDate}');
    //   debugPrint('Task, remainder time: ${x.remainderTime}');

    //   debugPrint('Task, due date: ${x.dueDate}');
    //   debugPrint('Task, repeat: ${x.repeat?.name}');
    // }
  }

  void removePlanned(int index) {
    planned.removeAt(index);
    notifyListeners();
  }
}
