import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/providers/lists/myday.dart';

import '../providers/lists/starred.dart';
import '../providers/lists/planned.dart';

import '../data/enums.dart';
import '../data/models.dart';
import '../data/algos.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({
    Key? key,
    this.editTaskIndex,
    this.currentList,
  }) : super(key: key);

  final int? editTaskIndex;
  final DefaultLists? currentList;

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  TaskModel? taskModel;

  Icon remainderIcon =
      const Icon(IconData(0xe803, fontFamily: 'OutlinedFontIcons'));
  Text remainderTitle = const Text('Add remainder');
  Widget? remainderSubtitle;

  Icon dueIcon = const Icon(IconData(0xe80f, fontFamily: 'OutlinedFontIcons'));
  Widget dueTitle = const Text('Add due date');

  Icon repeatIcon =
      const Icon(IconData(0xe801, fontFamily: 'OutlinedFontIcons'));
  Text repeatTitle = const Text('Repeat');

  @override
  void initState() {
    super.initState();

    if (widget.editTaskIndex != null) {
      switch (widget.currentList) {
        case DefaultLists.MyDay:
          taskModel = context
              .read<MyDayList>()
              .myDayTasks
              .elementAt(widget.editTaskIndex!);
          break;
        case DefaultLists.Planned:
          taskModel = context
              .read<PlannedList>()
              .plannedTasks
              .elementAt(widget.editTaskIndex!);
          break;
        case DefaultLists.Starred:
          taskModel = context
              .read<StarredList>()
              .starredTasks
              .elementAt(widget.editTaskIndex!);
          break;
        case null:
          break;
      }

      if (taskModel!.dueDate != null) {}

      if (taskModel!.repeat != null) {}
    } else {
      taskModel = TaskModel();
      taskModel!.subtasks = <SubtaskModel>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    if (taskModel!.remainderDate != null && taskModel!.remainderTime != null) {
      remainderIcon = Icon(
        Icons.notifications_active_rounded,
        color: colorScheme.primary,
      );

      remainderTitle = Text(
        'Remind me at ${taskModel!.remainderTime!.hourOfPeriod}:${taskModel!.remainderTime!.minute} ${taskModel!.remainderTime!.period.name}',
        style: TextStyle(color: colorScheme.primary),
      );

      remainderSubtitle = Wrap(
        children: [
          Text(
            '${DaysOfWeek.values[taskModel!.remainderDate!.weekday - 1].name}, ',
            style: TextStyle(color: colorScheme.secondary),
          ),
          Text(
            taskModel!.remainderDate!.day.toString(),
            style: TextStyle(color: colorScheme.secondary),
          ),
          Text(
            ordinal(taskModel!.remainderDate!.day),
            style: TextStyle(
                color: colorScheme.secondary,
                fontSize: 10,
                fontFeatures: const [FontFeature.superscripts()]),
          ),
          Text(
            ' ${Months.values[taskModel!.remainderDate!.month - 1].name}',
            style: TextStyle(color: colorScheme.secondary),
          ),
          Text(
            ' ${taskModel!.remainderDate!.year.toString()}',
            style: TextStyle(color: colorScheme.secondary),
          ),
        ],
      );
    }

    if (taskModel!.dueDate != null) {
      dueTitle = Wrap(
        children: [
          Text('Due ', style: TextStyle(color: colorScheme.primary)),
          Text('${DaysOfWeek.values[taskModel!.dueDate!.weekday - 1].name}, ',
              style: TextStyle(color: colorScheme.primary)),
          Text(taskModel!.dueDate!.day.toString(),
              style: TextStyle(color: colorScheme.primary)),
          Text(
            ordinal(taskModel!.dueDate!.day),
            style: TextStyle(
                color: colorScheme.primary,
                fontSize: 11,
                fontFeatures: const [FontFeature.superscripts()]),
          ),
          Text(' ${Months.values[taskModel!.dueDate!.month - 1].name}',
              style: TextStyle(color: colorScheme.primary)),
          Text(' ${taskModel!.dueDate!.year.toString()}',
              style: TextStyle(color: colorScheme.primary)),
        ],
      );
      dueIcon = Icon(Icons.event_rounded, color: colorScheme.primary);
    }

    if (taskModel!.repeat != null) {
      repeatTitle = Text('Repeat ${taskModel!.repeat!.name}',
          style: TextStyle(color: colorScheme.primary));
      repeatIcon = Icon(Icons.event_repeat_rounded, color: colorScheme.primary);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.secondaryContainer,
        leading: IconButton(
          icon: Icon(
            Icons.close_rounded,
            color: colorScheme.onSecondaryContainer,
          ),
          onPressed: (() => Navigator.pop(context)),
        ),
        title: const Text('Create Task'),
        titleTextStyle: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontSize: 19,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (widget.editTaskIndex != null) {
                switch (widget.currentList) {
                  case DefaultLists.MyDay:
                    context
                        .read<MyDayList>()
                        .updateTask(widget.editTaskIndex!, taskModel!);
                    break;
                  case DefaultLists.Planned:
                    context
                        .read<PlannedList>()
                        .updateTask(widget.editTaskIndex!, taskModel!);
                    break;
                  case DefaultLists.Starred:
                    context
                        .read<StarredList>()
                        .updateTask(widget.editTaskIndex!, taskModel!);
                    break;
                  case null:
                    break;
                }
              } else {
                switch (widget.currentList) {
                  case DefaultLists.MyDay:
                    context.read<MyDayList>().addTask(taskModel!);
                    break;
                  case DefaultLists.Planned:
                    context.read<PlannedList>().addTask(taskModel!);
                    break;
                  case DefaultLists.Starred:
                    context.read<StarredList>().addTask(taskModel!);
                    break;
                  case null:
                    context.read<PlannedList>().addTask(taskModel!);
                    break;
                }
              }
              Navigator.pop(context);
            },
            child: Text(
              'Save',
              style: TextStyle(color: colorScheme.inverseSurface),
            ),
          )
        ],
      ),
      body: ListView(children: [
        //title textfield
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
          child: TextField(
            controller: TextEditingController(
              text: taskModel!.title,
            ),
            onChanged: (value) => taskModel!.title = value,
            decoration: InputDecoration(
              label: const Text('Title'),
              prefixIcon: IconButton(
                icon: Icon(
                  taskModel!.isStarred
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  color: taskModel!.isStarred ? colorScheme.primary : null,
                ),
                onPressed: () {
                  setState(() {
                    taskModel!.isStarred
                        ? taskModel!.isStarred = false
                        : taskModel!.isStarred = true;
                  });
                },
              ),
              suffixIcon: Checkbox(
                checkColor: colorScheme.onPrimary,
                activeColor: colorScheme.primary,
                value: taskModel!.isChecked,
                onChanged: (value) {
                  setState(() {
                    taskModel!.isChecked = value!;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.outline),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),

        // Subtask list
        Padding(
          padding: const EdgeInsets.only(left: 46, right: 8),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: taskModel!.subtasks!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: TextEditingController(
                    text: taskModel!.subtasks!.elementAt(index).title,
                  ),
                  onChanged: (value) {
                    taskModel!.subtasks!.elementAt(index).title = value;
                  },
                  decoration: InputDecoration(
                      label: const Text('Subtitle'),
                      suffixIcon:
                          Row(mainAxisSize: MainAxisSize.min, children: [
                        Checkbox(
                            checkColor: colorScheme.onSecondary,
                            activeColor: colorScheme.secondary,
                            value:
                                taskModel!.subtasks!.elementAt(index).isChecked,
                            onChanged: (value) {
                              setState(() {
                                taskModel!.subtasks!
                                    .elementAt(index)
                                    .isChecked = value!;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        IconButton(
                            icon: const Icon(Icons.close_rounded),
                            onPressed: () {
                              setState(() {
                                taskModel!.subtasks!.removeAt(index);
                              });
                            }),
                      ]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
              );
            },
          ),
        ),

        //Add Subtask Button
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  taskModel!.subtasks!.add(SubtaskModel());
                });
              },
              icon:
                  const Icon(IconData(0xe811, fontFamily: 'OutlinedFontIcons')),
              label: const Text('Subtask'),
            ),
          ),
        ),
        const Divider(indent: 138, endIndent: 138),

        //Remainder
        ListTile(
          leading: SizedBox(
            height: double.infinity,
            child: remainderIcon,
          ),
          title: remainderTitle,
          subtitle: remainderSubtitle,
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 10),
            );
            TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context),
                  child: child!,
                );
              },
            );

            taskModel!.remainderDate = date;
            taskModel!.remainderTime = time;

            setState(() {
              remainderIcon = Icon(
                Icons.notifications_active_rounded,
                color: colorScheme.primary,
              );

              remainderTitle = Text(
                'Remind me at ${time?.hourOfPeriod}:${time?.minute} ${time?.period.name}',
                style: TextStyle(color: colorScheme.primary),
              );

              remainderSubtitle = Wrap(
                children: [
                  Text(
                    '${DaysOfWeek.values[date!.weekday - 1].name}, ',
                    style: TextStyle(color: colorScheme.secondary),
                  ),
                  Text(
                    date.day.toString(),
                    style: TextStyle(color: colorScheme.secondary),
                  ),
                  Text(
                    ordinal(date.day),
                    style: TextStyle(
                        color: colorScheme.secondary,
                        fontSize: 10,
                        fontFeatures: const [FontFeature.superscripts()]),
                  ),
                  Text(
                    ' ${Months.values[date.month - 1].name}',
                    style: TextStyle(color: colorScheme.secondary),
                  ),
                  Text(
                    ' ${date.year.toString()}',
                    style: TextStyle(color: colorScheme.secondary),
                  ),
                ],
              );
            });
          },
        ),
        const Divider(indent: 68),

        //Due
        ListTile(
          leading: dueIcon,
          title: dueTitle,
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 10),
            );
            taskModel!.dueDate = date;
            setState(() {
              dueTitle = Wrap(
                children: [
                  Text('Due ', style: TextStyle(color: colorScheme.primary)),
                  Text('${DaysOfWeek.values[date!.weekday - 1].name}, ',
                      style: TextStyle(color: colorScheme.primary)),
                  Text(date.day.toString(),
                      style: TextStyle(color: colorScheme.primary)),
                  Text(
                    ordinal(date.day),
                    style: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 11,
                        fontFeatures: const [FontFeature.superscripts()]),
                  ),
                  Text(' ${Months.values[date.month - 1].name}',
                      style: TextStyle(color: colorScheme.primary)),
                  Text(' ${date.year.toString()}',
                      style: TextStyle(color: colorScheme.primary)),
                ],
              );
              dueIcon = Icon(Icons.event_rounded, color: colorScheme.primary);
            });
          },
        ),
        const Divider(indent: 68),

        //Repeat
        PopupMenuButton<RepeatTask>(
          offset: const Offset(1, 0),
          child: ListTile(
            leading: repeatIcon,
            title: repeatTitle,
          ),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<RepeatTask>>[
            PopupMenuItem(
                value: RepeatTask.Daily, child: Text(RepeatTask.Daily.name)),
            PopupMenuItem(
                value: RepeatTask.Monthly,
                child: Text(RepeatTask.Monthly.name)),
            PopupMenuItem(
                value: RepeatTask.Weekday,
                child: Text(RepeatTask.Weekday.name)),
            PopupMenuItem(
                value: RepeatTask.Weekend,
                child: Text(RepeatTask.Weekend.name)),
            PopupMenuItem(
                value: RepeatTask.Weekly, child: Text(RepeatTask.Weekly.name)),
            PopupMenuItem(
                value: RepeatTask.Yearly, child: Text(RepeatTask.Yearly.name)),
          ],
          onSelected: (value) {
            setState(() {
              taskModel!.repeat = value;
              repeatTitle = Text('Repeat ${value.name}',
                  style: TextStyle(color: colorScheme.primary));
              repeatIcon =
                  Icon(Icons.event_repeat_rounded, color: colorScheme.primary);
            });
          },
        ),
        const Divider(indent: 68),

        //Delete
        Visibility(
          visible: widget.editTaskIndex == null ? false : true,
          child: ListTile(
            leading: Icon(
              const IconData(0xe800, fontFamily: 'DeleteFontIcon'),
              color: colorScheme.error,
            ),
            title:
                Text('Delete Task', style: TextStyle(color: colorScheme.error)),
            onTap: () {
              switch (widget.currentList) {
                case DefaultLists.MyDay:
                  context.read<MyDayList>().removeTask(widget.editTaskIndex!);
                  break;
                case DefaultLists.Planned:
                  context.read<PlannedList>().removeTask(widget.editTaskIndex!);
                  break;
                case DefaultLists.Starred:
                  context.read<StarredList>().removeTask(widget.editTaskIndex!);
                  break;
                case null:
                  break;
              }
              Navigator.pop(context);
            },
          ),
        ),
        Visibility(
          visible: widget.editTaskIndex == null ? false : true,
          child: const Divider(indent: 68),
        ),

        //Note
        // ListTile(
        //     leading: Icon(IconData(0xe816, fontFamily: 'OutlinedFontIcons')),
        //     title: Text('Add note')),
        // const Divider(indent: 68),
      ]),
    );
  }
}
