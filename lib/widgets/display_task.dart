import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_database/database_provider.dart';

import '../enums.dart';
import '../functions.dart';
import '../isar_database/collections.dart';

class DisplayTask extends StatefulWidget {
  const DisplayTask({this.task, Key? key}) : super(key: key);

  final Task? task;

  @override
  State<DisplayTask> createState() => _DisplayTaskState();
}

class _DisplayTaskState extends State<DisplayTask> {
  late Task task;

  //remainder widget
  Icon remainderIcon =
      const Icon(IconData(0xe803, fontFamily: 'OutlinedFontIcons'));
  Text remainderTitle = const Text('Add remainder');
  Widget? remainderSubtitle;

  //due widget
  Icon dueIcon = const Icon(IconData(0xe80f, fontFamily: 'OutlinedFontIcons'));
  Text dueTitle = const Text('Add due date');
  Widget? dueSubtitle;

  //repeat widget
  Icon repeatIcon =
      const Icon(IconData(0xe801, fontFamily: 'OutlinedFontIcons'));
  Text repeatTitle = const Text('Repeat');

  @override
  void initState() {
    super.initState();
    //instatiate task
    //previous task
    if (widget.task != null) {
      task = widget.task!;
    }
    //new task
    else {
      var provider = context.read<DatabaseProvider>();
      task = Task(
        id: provider.tempTaskId(),
        groupId: provider.activeGroupId,
        listId: provider.activeListId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    if (task.remainder != null) {
      remainderIcon = Icon(
        Icons.notifications_active_rounded,
        color: colorScheme.primary,
      );

      var remainderTime =
          TimeOfDay(hour: task.remainder!.hour, minute: task.remainder!.minute);
      remainderTitle = Text(
        'Remind me at ${remainderTime.hourOfPeriod}:${remainderTime.minute} ${remainderTime.period.name}',
        style: TextStyle(color: colorScheme.primary),
      );

      remainderSubtitle = Wrap(
        children: [
          Text(
            '${DaysOfWeek.values[task.remainder!.weekday - 1].name}, ',
            style: TextStyle(color: colorScheme.secondary),
          ),
          Text(
            task.remainder!.day.toString(),
            style: TextStyle(color: colorScheme.secondary),
          ),
          Text(
            ordinal(task.remainder!.day),
            style: TextStyle(
              color: colorScheme.secondary,
              fontSize: 10,
              fontFeatures: const [FontFeature.superscripts()],
            ),
          ),
          Text(
            ' ${Months.values[task.remainder!.month - 1].name}',
            style: TextStyle(color: colorScheme.secondary),
          ),
          Text(
            ' ${task.remainder!.year.toString()}',
            style: TextStyle(color: colorScheme.secondary),
          ),
        ],
      );
    }

    if (task.due != null) {
      dueIcon = Icon(Icons.event_rounded, color: colorScheme.primary);
      var dueTime = TimeOfDay(hour: task.due!.hour, minute: task.due!.minute);
      dueTitle = Text(
        'Due at ${dueTime.hourOfPeriod}:${dueTime.minute} ${dueTime.period.name}',
        style: TextStyle(color: colorScheme.primary),
      );
      dueSubtitle = Wrap(
        children: [
          Text(
            '${DaysOfWeek.values[task.due!.weekday - 1].name}, ',
            style: TextStyle(color: colorScheme.secondary),
          ),
          Text(
            task.due!.day.toString(),
            style: TextStyle(color: colorScheme.secondary),
          ),
          Text(
            ordinal(task.due!.day),
            style: TextStyle(
              color: colorScheme.secondary,
              fontSize: 10,
              fontFeatures: const [FontFeature.superscripts()],
            ),
          ),
          Text(
            ' ${Months.values[task.due!.month - 1].name}',
            style: TextStyle(color: colorScheme.secondary),
          ),
          Text(
            ' ${task.due!.year.toString()}',
            style: TextStyle(color: colorScheme.secondary),
          ),
        ],
      );
    }

    if (task.repeat != null) {
      repeatTitle = Text(
          'Repeat ${RepeatTask.values.elementAt(task.repeat!).name}',
          style: TextStyle(color: colorScheme.primary));
      repeatIcon = Icon(Icons.event_repeat_rounded, color: colorScheme.primary);
    }

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: IconButton(
          //close button
          icon: Icon(
            Icons.close_rounded,
            color: colorScheme.secondary,
          ),
          onPressed: (() {
            ScaffoldMessenger.of(context).clearSnackBars();
            Navigator.pop(context);
          }),
        ),
        title: Text(widget.task == null ? 'Create Task' : 'Edit Task'),
        titleTextStyle: TextStyle(
          color: colorScheme.secondary,
          fontSize: 19,
        ),
        actions: [
          //Save button
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              // //task title is null
              // if (task.title == null) {
              //   ScaffoldMessenger.of(context).clearSnackBars();
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       backgroundColor: colorScheme.primary,
              //       content: Text(
              //         'Please enter task title',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: colorScheme.onPrimary,
              //         ),
              //       ),
              //     ),
              //   );
              // }
              // //task title is not null
              // else {
              //   //update task
              //   if (widget.task != null) {
              //     context.read<CollectionsProvider>().updateTask(task);
              //   }
              //   //create new task
              //   else {
              //     context.read<CollectionsProvider>().addTask(task);
              //   }

              //   context
              //       .read<CollectionsProvider>()
              //       .addSubtasks(task.id!, subtasks);

              //   ScaffoldMessenger.of(context).clearSnackBars();
              //   Navigator.pop(context);
              // }
            },
          )
        ],
      ),
      body: ListView(children: [
        //title textfield
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
          child: TextField(
            controller: TextEditingController(
              text: task.title,
            ),
            onChanged: (value) => task.title = value,
            decoration: InputDecoration(
              label: const Text('Title'),
              prefixIcon: IconButton(
                icon: Icon(
                  task.isStarred
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  color: task.isStarred ? colorScheme.primary : null,
                ),
                onPressed: () {
                  setState(() {
                    task.isStarred
                        ? task.isStarred = false
                        : task.isStarred = true;
                  });
                },
              ),
              suffixIcon: Checkbox(
                checkColor: colorScheme.onPrimary,
                activeColor: colorScheme.primary,
                value: task.isChecked,
                onChanged: (value) {
                  setState(() {
                    task.isChecked = value!;
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
        // Padding(
        //   padding: const EdgeInsets.only(left: 46, right: 8),
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     itemCount: subtasks.length,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.only(top: 8),
        //         child: TextField(
        //           controller: TextEditingController(
        //             text: subtasks.elementAt(index).title,
        //           ),
        //           onChanged: (value) {
        //             subtasks.elementAt(index).title = value;
        //           },
        //           decoration: InputDecoration(
        //               label: const Text('Subtitle'),
        //               suffixIcon:
        //                   Row(mainAxisSize: MainAxisSize.min, children: [
        //                 Checkbox(
        //                     checkColor: colorScheme.onSecondary,
        //                     activeColor: colorScheme.secondary,
        //                     value: subtasks.elementAt(index).isChecked,
        //                     onChanged: (value) {
        //                       setState(() {
        //                         subtasks.elementAt(index).isChecked = value!;
        //                       });
        //                     },
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(5),
        //                     )),
        //                 IconButton(
        //                     icon: const Icon(Icons.close_rounded),
        //                     onPressed: () {
        //                       setState(() {
        //                         subtasks.removeAt(index);
        //                       });
        //                     }),
        //               ]),
        //               border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(18))),
        //         ),
        //       );
        //     },
        //   ),
        // ),

        //Add Subtask Button
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.secondary,
              ),
              onPressed: () {},
              icon: const Icon(Icons.add_rounded),
              label: const Text('Subtask'),
            ),
          ),
        ),

        const SizedBox(height: 8),

        const Divider(
          indent: 138,
          endIndent: 138,
          height: 1,
        ),

        //Remainder
        ListTile(
          minVerticalPadding: 18,
          leading: SizedBox(
            height: double.infinity,
            child: remainderIcon,
          ),
          title: remainderTitle,
          subtitle: remainderSubtitle,
          onTap: () async {
            DateTime? date = await showDatePicker(
              builder: (context, child) =>
                  Theme(data: ThemeData.dark().copyWith(
                    dialogBackgroundColor: colorScheme.background,
                    colorScheme: ColorScheme.dark(
                      primary: colorScheme.primary,
                      onPrimary: colorScheme.surface,
                      surface: colorScheme.surface,
                      onSurface: colorScheme.secondary
                    )
                  ), child: child!),
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

            if (date != null && time != null) {
              task.remainder = DateTime(
                date.year,
                date.month,
                date.day,
                time.hour,
                time.minute,
              );

              setState(() {
                remainderIcon = Icon(
                  Icons.notifications_active_rounded,
                  color: colorScheme.primary,
                );

                remainderTitle = Text(
                  'Remind me at ${time.hourOfPeriod}:${time.minute} ${time.period.name}',
                  style: TextStyle(color: colorScheme.primary),
                );

                remainderSubtitle = Wrap(
                  children: [
                    Text(
                      '${DaysOfWeek.values[date.weekday - 1].name}, ',
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
            }
          },
        ),
        const Divider(
          indent: 68,
          height: 1,
        ),

        //Due
        ListTile(
          minVerticalPadding: 18,
          leading: dueIcon,
          title: dueTitle,
          subtitle: dueSubtitle,
          onTap: () async {
            DateTime? date = await showDatePicker(
              builder: (context, child) =>
                  Theme(data: ThemeData.dark().copyWith(
                    dialogBackgroundColor: colorScheme.background,
                    colorScheme: ColorScheme.dark(
                      primary: colorScheme.primary,
                      onPrimary: colorScheme.surface,
                      surface: colorScheme.surface,
                      onSurface: colorScheme.secondary
                    )
                  ), child: child!),
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 15),
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

            if (date != null && time != null) {
              task.due = DateTime(
                date.year,
                date.month,
                date.day,
                time.hour,
                time.minute,
              );
              setState(() {
                dueIcon = Icon(Icons.event_rounded, color: colorScheme.primary);
                dueTitle = Text(
                  'Remind me at ${time.hourOfPeriod}:${time.minute} ${time.period.name}',
                  style: TextStyle(color: colorScheme.primary),
                );

                dueSubtitle = Wrap(
                  children: [
                    Text(
                      '${DaysOfWeek.values[date.weekday - 1].name}, ',
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
                        fontFeatures: const [FontFeature.superscripts()],
                      ),
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
            }
          },
        ),
        const Divider(indent: 68, height: 1),

        //Repeat
        PopupMenuButton<RepeatTask>(
          color: colorScheme.surface,
          offset: const Offset(1, 0),
          child: ListTile(
            minVerticalPadding: 18,
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
              task.repeat = value.index;
              repeatTitle = Text('Repeat ${value.name}',
                  style: TextStyle(color: colorScheme.primary));
              repeatIcon =
                  Icon(Icons.event_repeat_rounded, color: colorScheme.primary);
            });
          },
        ),
        const Divider(
          indent: 68,
          height: 1,
        ),

        //Delete
        Visibility(
          visible: widget.task == null ? false : true,
          child: ListTile(
            minVerticalPadding: 18,
            leading: Icon(
              const IconData(0xe800, fontFamily: 'DeleteFontIcon'),
              color: colorScheme.error,
            ),
            title:
                Text('Delete Task', style: TextStyle(color: colorScheme.error)),
            onTap: () {
              // context.read<CollectionsProvider>().removeTask(task.id!);
              // Navigator.pop(context);
            },
          ),
        ),
        Visibility(
          visible: widget.task == null ? false : true,
          child: const Divider(
            indent: 68,
            height: 1,
          ),
        ),

        //Note
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            minLines: 3,
            maxLines: 6,
            controller: TextEditingController(
              text: task.note,
            ),
            onChanged: (value) => task.note = value,
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              label: Text('Note'),
            ),
          ),
        ),
      ]),
    );
  }
}
