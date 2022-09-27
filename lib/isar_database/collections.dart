import 'package:isar/isar.dart';
part 'collections.g.dart';

@Collection()
class Subtask {
  Subtask({
    required this.id,
    required this.groupId,
    required this.listId,
    required this.taskId,
    this.isChecked = false,
    this.title,
  });

  int id;
  int groupId;
  int listId;
  int taskId;

  bool isChecked;
  String? title;
}

@Collection()
class Task {
  Task({
    required this.id,
    required this.groupId,
    required this.listId,
    this.title,
    this.isStarred = false,
    this.isChecked = false,
    this.remainder,
    this.due,
    this.repeat,
    this.note,
  });

  int id;
  int groupId;
  int listId;

  String? title;
  bool isStarred;
  bool isChecked;
  DateTime? remainder;
  DateTime? due;
  int? repeat;
  String? note;
}

@Collection()
class TaskList {
  TaskList({
    required this.id,
    required this.groupId,
    required this.name,
  });

  int id;
  int groupId;

  String name;
}

@Collection()
class Group {
  Group({required this.id, required this.name});

  int id;

  @Index(unique: true)
  String name;
}
