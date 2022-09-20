// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:flutter/material.dart';

import '../isar_db/collections.dart';
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

Widget? generateSubtitle(Task taskModel) {
  if (taskModel.remainder == null &&
      taskModel.due == null &&
      taskModel.repeatTask == null)
    return null;
  else {
    return SizedBox(
      height: 18,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          if (taskModel.remainder != null)
            Wrap(
              children: [
                const SizedBox(
                  height: 20,
                  child: Icon(Icons.notifications_active_outlined, size: 16),
                ),
                const SizedBox(width: 4),
                Text(taskModel.remainder!.day.toString()),
                Text(
                  ordinal(taskModel.remainder!.day),
                  style: const TextStyle(
                      fontFeatures: [FontFeature.superscripts()], fontSize: 10),
                ),
                Text(
                    ' ${Months.values.elementAt(taskModel.remainder!.month - 1).name}'),
                const SizedBox(width: 12),
              ],
            ),
          if (taskModel.due != null)
            Wrap(
              children: [
                const SizedBox(
                  height: 20,
                  child: Icon(Icons.event_outlined, size: 16),
                ),
                const SizedBox(width: 4),
                Text(taskModel.due!.day.toString()),
                Text(
                  ordinal(taskModel.due!.day),
                  style: const TextStyle(
                      fontFeatures: [FontFeature.superscripts()], fontSize: 10),
                ),
                Text(
                    ' ${Months.values.elementAt(taskModel.due!.month - 1).name}'),
                const SizedBox(width: 12),
              ],
            ),
          if (taskModel.repeatTask != null)
            Wrap(
              children: [
                const SizedBox(
                  height: 20,
                  child: Icon(Icons.event_repeat_outlined, size: 16),
                ),
                const SizedBox(width: 4),
                Text(RepeatTask.values.elementAt(taskModel.repeatTask!).name),
                const SizedBox(width: 12),
              ],
            ),
        ],
      ),
    );
  }
}
