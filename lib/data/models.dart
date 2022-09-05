import 'package:flutter/material.dart';
import 'package:tasks/data/enums.dart';

class SubtaskModel {
  String? title;
  bool isChecked;

  SubtaskModel({this.title, this.isChecked = false});
}

class TaskModel {
  TaskModel({
    required this.isStarred,
    required this.isChecked,
    required this.title,
    this.subtasks,
    this.remainderDate,
    this.remainderTime,
    this.dueDate,
    this.repeat,
    this.note,
  });

  bool isStarred;
  bool isChecked;
  String title;

  //subtasks
  List<SubtaskModel>? subtasks;

  //remainder
  DateTime? remainderDate;
  TimeOfDay? remainderTime;

  //due
  DateTime? dueDate;

  //repeat
  RepeatTask? repeat;

  //note
  String? note;
}
