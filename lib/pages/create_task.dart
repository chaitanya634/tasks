import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/data/algos.dart';
import 'package:tasks/providers/task_lists.dart';
import 'dart:ui';

import '../data/enums.dart';
import '../data/models.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key, this.taskModelIndex, this.colorScheme})
      : super(key: key);

  final int? taskModelIndex;
  final ColorScheme? colorScheme;

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  //title
  bool isStarred = false;
  bool isChecked = false;
  String? title;

  //subtasks
  List<SubtaskModel> subtasks = [];

  //remainder
  DateTime? remainderDate;
  TimeOfDay? remainderTime;
  Widget? rTitle = const Text('Add reaminder'), rSubtitle;
  Icon rIcon = const Icon(IconData(0xe803, fontFamily: 'OutlinedFontIcons'));

  //due
  DateTime? dueDate;
  Widget dTitle = const Text('Add due date');
  Icon dueIcon = const Icon(IconData(0xe802, fontFamily: 'OutlinedFontIcons'));

  //repeat
  RepeatTask? repeat;
  Widget repeatTitle = const Text('Repeat');
  Icon repeatIcon =
      const Icon(IconData(0xe801, fontFamily: 'OutlinedFontIcons'));

  //note
  String? note;

  @override
  void initState() {
    super.initState();
    if (widget.taskModelIndex != null && widget.colorScheme != null) {
      ColorScheme? colorScheme = widget.colorScheme!;
      TaskModel element =
          context.read<TaskLists>().planned.elementAt(widget.taskModelIndex!);

      title = element.title;
      isStarred = element.isStarred;
      isChecked = element.isChecked;

      subtasks = element.subtasks!;

      if (element.remainderDate != null && element.remainderTime != null) {
        remainderDate = element.remainderDate;
        remainderTime = element.remainderTime;
        rIcon = Icon(
          Icons.notifications_active_rounded,
          color: colorScheme.primary,
        );
        rTitle = Text(
          'Remind me at ${remainderTime!.hourOfPeriod}:${remainderTime!.minute} ${remainderTime!.period.name}',
          style: TextStyle(color: colorScheme.primary),
        );
        rSubtitle = Wrap(
          children: [
            Text(
              '${DaysOfWeek.values[remainderDate!.weekday - 1].name}, ',
              style: TextStyle(color: colorScheme.secondary),
            ),
            Text(
              remainderDate!.day.toString(),
              style: TextStyle(color: colorScheme.secondary),
            ),
            Text(
              ordinal(remainderDate!.day),
              style: TextStyle(
                  color: colorScheme.secondary,
                  fontSize: 10,
                  fontFeatures: const [FontFeature.superscripts()]),
            ),
            Text(
              ' ${Months.values[remainderDate!.month - 1].name}',
              style: TextStyle(color: colorScheme.secondary),
            ),
            Text(
              ' ${remainderDate!.year.toString()}',
              style: TextStyle(color: colorScheme.secondary),
            ),
          ],
        );
      }

      if (element.dueDate != null) {
        dueDate = element.dueDate;
        dTitle = Wrap(
          children: [
            Text('Due ', style: TextStyle(color: colorScheme.primary)),
            Text('${DaysOfWeek.values[dueDate!.weekday - 1].name}, ',
                style: TextStyle(color: colorScheme.primary)),
            Text(dueDate!.day.toString(),
                style: TextStyle(color: colorScheme.primary)),
            Text(
              ordinal(dueDate!.day),
              style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 11,
                  fontFeatures: const [FontFeature.superscripts()]),
            ),
            Text(' ${Months.values[dueDate!.month - 1].name}',
                style: TextStyle(color: colorScheme.primary)),
            Text(' ${dueDate!.year.toString()}',
                style: TextStyle(color: colorScheme.primary)),
          ],
        );
        dueIcon = Icon(Icons.event_rounded, color: colorScheme.primary);
      }

      if (element.repeat != null) {
        repeat = element.repeat;
        repeatTitle = Text('Repeat ${repeat!.name}',
            style: TextStyle(color: colorScheme.primary));
        repeatIcon =
            Icon(Icons.event_repeat_rounded, color: colorScheme.primary);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.secondaryContainer,
        leading: IconButton(
            icon: Icon(
              Icons.close_rounded,
              color: colorScheme.onSecondaryContainer,
            ),
            onPressed: (() => Navigator.pop(context))),
        title: const Text('Create Task'),
        titleTextStyle: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontSize: 19,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (widget.taskModelIndex == null) {
                context.read<TaskLists>().addPlanned(TaskModel(
                      isStarred: isStarred,
                      isChecked: isChecked,
                      title: title!,
                      subtasks: subtasks,
                      dueDate: dueDate,
                      remainderDate: remainderDate,
                      remainderTime: remainderTime,
                      repeat: repeat,
                    ));
              } else {
                context.read<TaskLists>().updatePlanned(
                    widget.taskModelIndex!,
                    TaskModel(
                      isStarred: isStarred,
                      isChecked: isChecked,
                      title: title!,
                      dueDate: dueDate,
                      remainderDate: remainderDate,
                      remainderTime: remainderTime,
                      repeat: repeat,
                      subtasks: subtasks,
                    ));
              }
              Navigator.pop(context);
            },
            child: Text('Save', 
            style: TextStyle(color: colorScheme.inverseSurface)
            ),
          )
        ],
      ),
      body: ListView(children: [
        //title textfield
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
          child: TextField(
            controller: TextEditingController(text: title),
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(
              label: const Text('Title'),
              prefixIcon: IconButton(
                icon: Icon(
                  isStarred ? Icons.star_rounded : Icons.star_border_rounded,
                  color: isStarred ? colorScheme.primary : null,
                ),
                onPressed: () {
                  setState(() {
                    isStarred ? isStarred = false : isStarred = true;
                  });
                },
              ),
              suffixIcon: Checkbox(
                  checkColor: colorScheme.onPrimary,
                  activeColor: colorScheme.primary,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
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
            itemCount: subtasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: TextEditingController(
                      text: subtasks.elementAt(index).title),
                  onChanged: (value) {
                    subtasks.elementAt(index).title = value;
                  },
                  decoration: InputDecoration(
                      label: const Text('Subtitle'),
                      suffixIcon:
                          Row(mainAxisSize: MainAxisSize.min, children: [
                        Checkbox(
                            checkColor: colorScheme.onSecondary,
                            activeColor: colorScheme.secondary,
                            value: subtasks.elementAt(index).isChecked,
                            onChanged: (value) {
                              setState(() {
                                subtasks.elementAt(index).isChecked = value!;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        IconButton(
                            icon: const Icon(Icons.close_rounded),
                            onPressed: () {
                              setState(() {
                                subtasks.removeAt(index);
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
                  subtasks.add(SubtaskModel());
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
            child: rIcon,
          ),
          title: rTitle!,
          subtitle: rSubtitle,
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

            remainderDate = date;
            remainderTime = time;

            setState(() {
              rIcon = Icon(
                Icons.notifications_active_rounded,
                color: colorScheme.primary,
              );

              rTitle = Text(
                'Remind me at ${time?.hourOfPeriod}:${time?.minute} ${time?.period.name}',
                style: TextStyle(color: colorScheme.primary),
              );

              rSubtitle = Wrap(
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
          title: dTitle,
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 10),
            );
            dueDate = date;
            setState(() {
              dTitle = Wrap(
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
              repeat = value;
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
          visible: widget.taskModelIndex == null ? false : true,
          child: ListTile(
            leading: Icon(
              const IconData(0xe800, fontFamily: 'DeleteFontIcon'),
              color: colorScheme.error,
            ),
            title:
                Text('Delete Task', style: TextStyle(color: colorScheme.error)),
            onTap: () {
              context.read<TaskLists>().removePlanned(widget.taskModelIndex!);
              Navigator.pop(context);
            },
          ),
        ),
        Visibility(
          visible: widget.taskModelIndex == null ? false : true,
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
