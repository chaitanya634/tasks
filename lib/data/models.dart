import 'package:flutter/material.dart';
import 'package:tasks/data/enums.dart';

class SubtaskModel {
  SubtaskModel({
    this.title,
    this.isChecked = false,
  });

  String? title;
  bool isChecked;
}

class TaskModel {
  TaskModel({
    this.title,
    this.isStarred = false,
    this.isChecked = false,
    this.subtasks,
    this.remainderDate,
    this.remainderTime,
    this.dueDate,
    this.repeat,
    this.note,
  });

  //title
  bool isStarred;
  bool isChecked;
  String? title;

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
