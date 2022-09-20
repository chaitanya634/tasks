import 'package:isar/isar.dart';
part 'collections.g.dart';

@Collection()
class Subtask {
  Id id = Isar.autoIncrement;
  late String taskName;
  @Index(unique: true)
  late String title;
  late bool isChecked;
}

@Collection()
class Task {
  Id id = Isar.autoIncrement;
  late String groupName;
  late String listName;

  @Index(unique: true)
  late String title;
  late bool isStarred;
  late bool isChecked;
  var subtasks = IsarLinks<Subtask>();
  DateTime? remainder;
  DateTime? due;
  int? repeatTask;
  String? note;
}

@Collection()
class TaskList {
  Id id = Isar.autoIncrement;
  late String groupName;
  @Index(unique: true)
  late String name;
  var tasks = IsarLinks<Task>();
}

@Collection()
class Group {
  Id id = Isar.autoIncrement;
  @Index(unique: true)
  late String name;
  var lists = IsarLinks<TaskList>();
}
