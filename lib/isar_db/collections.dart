import 'package:isar/isar.dart';
part 'collections.g.dart';

@Collection()
class Subtask {
  Subtask({
    required this.groupId,
    required this.listId,
    required this.taskId,
    this.isChecked = false,
    this.title,
  });

  int? id = Isar.autoIncrement;
  late int groupId;
  late int listId;
  late int taskId;

  bool isChecked;
  String? title;
}

@Collection()
class Task {
  Task({
    required this.groupId,
    required this.listId,
    this.isStarred = false,
    this.isChecked = false,
    this.title,
    this.remainder,
    this.due,
    this.repeat,
    this.note,
  });

  int? id = Isar.autoIncrement;
  late int groupId;
  late int listId;

  bool isStarred = false;
  bool isChecked = false;
  String? title;
  DateTime? remainder;
  DateTime? due;
  int? repeat;
  String? note;
}

@Collection()
class TaskList {
  TaskList({
    required this.groupId,
    required this.name,
    this.id,
  });

  int? id = Isar.autoIncrement;

  late int groupId;
  late String name;
}

@Collection()
class Group {
  Group({required this.name, this.id});

  int? id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;
}
