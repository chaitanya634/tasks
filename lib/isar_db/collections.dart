import 'package:isar/isar.dart';
part 'collections.g.dart';

@Collection()
class Subtasks {
  Id id = Isar.autoIncrement;
  late int groupId;
  late int listId;
  late int taskId;

  late String title;
  late bool isChecked;
}

@Collection()
class Tasks {
  Id id = Isar.autoIncrement;
  late int groupId;
  late int listId;

  late String title;
  late bool isStarred;
  late bool isChecked;
  DateTime? remainder;
  DateTime? due;
  int? repeatTask;
  String? note;
}

@Collection()
class Lists {
  Id id = Isar.autoIncrement;
  late int groupId;

  late String name;
}

@Collection()
class Groups {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;
}
