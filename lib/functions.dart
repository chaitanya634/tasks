import 'dart:ui';

import 'package:flutter/material.dart';

import 'isar_database/collections.dart';
import 'enums.dart';

String ordinal(int number) {
  switch (number) {
    case 1:
    case 21:
    case 31:
      return 'st';
    case 2:
    case 22:
      return 'nd';
    case 3:
    case 23:
      return 'rd';
    default:
      return 'th';
  }
}

Widget? generateSubtitle(Task taskModel) {
  if (taskModel.remainder == null &&
      taskModel.due == null &&
      taskModel.repeat == null) {
    return null;
  } else {
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
          if (taskModel.repeat != null)
            Wrap(
              children: [
                const SizedBox(
                  height: 20,
                  child: Icon(Icons.event_repeat_outlined, size: 16),
                ),
                const SizedBox(width: 4),
                Text(RepeatTask.values.elementAt(taskModel.repeat!).name),
                const SizedBox(width: 12),
              ],
            ),
        ],
      ),
    );
  }
}
