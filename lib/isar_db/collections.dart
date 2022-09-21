import 'package:isar/isar.dart';
part 'collections.g.dart';

@Collection()
class Subtasks {
  Id id = Isar.autoIncrement;
  late int groupId;
  late int listId;
  late int taskId;

  bool isChecked = false;
  String? title;
}

@Collection()
class Tasks {
  Id id = Isar.autoIncrement;
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
