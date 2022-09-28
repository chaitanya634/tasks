import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tasks/isar_database/database_provider.dart';
import 'package:provider/provider.dart';

import 'isar_database/collections.dart';
import 'enums.dart';

int generateId(BuildContext context, Collections collection) => context
    .read<DatabaseProvider>()
    .tempDatabase
    .entries
    .where((element) => element.key == collection)
    .first
    .value
    .length;

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

Widget? generateSubtitle(Task taskModel, ColorScheme colorScheme) {
  if (taskModel.remainder == null &&
      taskModel.due == null &&
      taskModel.repeat == null) {
    return null;
  } else {
    return Theme(
      data:
          ThemeData(iconTheme: IconThemeData(color: colorScheme.onBackground)),
      child: SizedBox(
        height: 18,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            if (taskModel.remainder != null)
              Wrap(
                children: [
                  SizedBox(
                    height: 20,
                    child: Icon(
                      Icons.notifications_active_outlined,
                      size: 16,
                      color: colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    taskModel.remainder!.day.toString(),
                    style: TextStyle(color: colorScheme.onBackground),
                  ),
                  Text(
                    ordinal(taskModel.remainder!.day),
                    style: TextStyle(
                        fontFeatures: const [FontFeature.superscripts()],
                        fontSize: 10,
                        color: colorScheme.onBackground),
                  ),
                  Text(
                    ' ${Months.values.elementAt(taskModel.remainder!.month - 1).name}',
                    style: TextStyle(color: colorScheme.onBackground),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            if (taskModel.due != null)
              Wrap(
                children: [
                  SizedBox(
                    height: 20,
                    child: Icon(
                      Icons.event_outlined,
                      size: 16,
                      color: colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    taskModel.due!.day.toString(),
                    style: TextStyle(color: colorScheme.onBackground),
                  ),
                  Text(
                    ordinal(taskModel.due!.day),
                    style: TextStyle(
                      fontFeatures: const [FontFeature.superscripts()],
                      fontSize: 10,
                      color: colorScheme.secondary,
                    ),
                  ),
                  Text(
                    ' ${Months.values.elementAt(taskModel.due!.month - 1).name}',
                    style: TextStyle(color: colorScheme.onBackground),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            if (taskModel.repeat != null)
              Wrap(
                children: [
                  SizedBox(
                    height: 20,
                    child: Icon(
                      Icons.event_repeat_outlined,
                      size: 16,
                      color: colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    RepeatTask.values.elementAt(taskModel.repeat!).name,
                    style: TextStyle(color: colorScheme.onBackground),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

String countTasks(BuildContext context, int listId) {
  int len = context
      .watch<DatabaseProvider>()
      .tempDatabase
      .entries
      .singleWhere((element) => element.key == Collections.Tasks)
      .value
      .where((element) {
    element = element as Task;
    return element.listId == listId;
  }).length;
  if (len > 9) {
    return '9+';
  }
  return len.toString();
}
