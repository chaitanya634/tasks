// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tasks/data/models.dart';

import 'enums.dart';

String ordinal(int number) {
  if (number == 1 || number == 21 || number == 31)
    return 'st';
  else if (number == 2 || number == 22)
    return 'nd';
  else if (number == 3 || number == 23)
    return 'rd';
  else
    return 'th';
}

Widget? generateSubtitle(TaskModel taskModel) {
  if (taskModel.remainderDate == null &&
      taskModel.dueDate == null &&
      taskModel.repeat == null)
    return null;
  else {
    return SizedBox(
      height: 18,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          if (taskModel.remainderDate != null)
            Wrap(
              children: [
                const SizedBox(
                  height: 20,
                  child: Icon(Icons.notifications_active_outlined, size: 16),
                ),
                const SizedBox(width: 4),
                Text(taskModel.remainderDate!.day.toString()),
                Text(
                  ordinal(taskModel.remainderDate!.day),
                  style: const TextStyle(
                      fontFeatures: [FontFeature.superscripts()], fontSize: 10),
                ),
                Text(
                    ' ${Months.values.elementAt(taskModel.remainderDate!.month - 1).name}'),
                const SizedBox(width: 12),
              ],
            ),
          if (taskModel.dueDate != null)
            Wrap(
              children: [
                const SizedBox(
                  height: 20,
                  child: Icon(Icons.event_outlined, size: 16),
                ),
                const SizedBox(width: 4),
                Text(taskModel.dueDate!.day.toString()),
                Text(
                  ordinal(taskModel.dueDate!.day),
                  style: const TextStyle(
                      fontFeatures: [FontFeature.superscripts()], fontSize: 10),
                ),
                Text(
                    ' ${Months.values.elementAt(taskModel.dueDate!.month - 1).name}'),
                const SizedBox(width: 12),
              ],
            ),
          if (taskModel.repeat != null)
            Wrap(
              children: [
                const SizedBox(
                  height: 20,
                  child: Icon(Icons.event_repeat_outlined, size: 16),
                ),
                const SizedBox(width: 4),
                Text(taskModel.repeat!.name),
                const SizedBox(width: 12),
              ],
            ),
        ],
      ),
    );
  }
}
