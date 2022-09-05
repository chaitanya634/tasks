import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/date_time.dart';
import '../data/enums.dart';
import '../data/models.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage(this.lightDynamic, {Key? key}) : super(key: key);
  final ColorScheme? lightDynamic;
  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  //title
  bool isStarred = false;
  bool isChecked = false;
  late String title;

  //subtasks
  List<SubtaskModel> subtasks = [];

  //remainder
  DateTime? remainderDate;
  TimeOfDay? remainderTime;

  //due
  DateTime? dueDate;

  //repeat
  RepeatTask? repeat;

  //note
  String? note;

  Widget? rTitle = const Text('Add reaminder'), rSubtitle;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            widget.lightDynamic?.onInverseSurface ?? colorScheme.surface,
        leading: IconButton(
            icon: Icon(
              Icons.close_rounded,
              color:
                  widget.lightDynamic?.inverseSurface ?? colorScheme.onSurface,
            ),
            onPressed: (() => Navigator.pop(context))),
        title: const Text('Create Task'),
        titleTextStyle: TextStyle(
          color: widget.lightDynamic?.inverseSurface ?? colorScheme.onSurface,
          fontSize: 19,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: TextStyle(
                  color: widget.lightDynamic?.primary ?? colorScheme.primary),
            ),
          )
        ],
      ),
      body: ListView(children: [
        //title textfield
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
          child: TextField(
            decoration: InputDecoration(
                label: const Text('Title'),
                prefixIcon: IconButton(
                  icon: Icon(
                    isStarred ? Icons.star_rounded : Icons.star_border_rounded,
                    color: isStarred
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isStarred ? isStarred = false : isStarred = true;
                    });
                  },
                ),
                suffixIcon: Checkbox(
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.lightDynamic?.outline ??
                            colorScheme.outline),
                    borderRadius: BorderRadius.circular(18))),
          ),
        ),

        // Subtask textfield list
        Padding(
          padding: const EdgeInsets.only(left: 46, right: 8),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: subtasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: TextField(
                  onChanged: (value) {
                    subtasks.elementAt(index).title = value;
                  },
                  decoration: InputDecoration(
                      label: const Text('Subtitle'),
                      suffixIcon:
                          Row(mainAxisSize: MainAxisSize.min, children: [
                        Checkbox(
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
                            icon: const Icon(
                              Icons.close_rounded,
                            ),
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
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black54)),
            ),
          ),
        ),
        const Divider(
          indent: 138,
          endIndent: 138,
        ),

        //Remainder
        ListTile(
          leading: const SizedBox(
              height: double.infinity,
              child: Icon(IconData(0xe803, fontFamily: 'OutlinedFontIcons'))),
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
                  data: ThemeData.light(),
                  child: child!,
                );
              },
            );
            setState(() {
              rTitle = Text(
                'Remind me at ${time?.hourOfPeriod}:${time?.minute} ${time?.period.name}',
              );

              rSubtitle = Row(
                children: [
                  Text('${DaysOfWeek.values[date!.weekday - 1].name}, '),
                  context
                      .read<DateTimeProvider>()
                      .date(context, Theme.of(context).colorScheme, date, 14),
                  Text(' ${date.year.toString()}'),
                ],
              );
            });
          },
        ),
        const Divider(indent: 68),
        const ListTile(
            leading: Icon(IconData(0xe802, fontFamily: 'OutlinedFontIcons')),
            title: Text('Add due date')),
        Divider(indent: 68),
        ListTile(
            leading: Icon(IconData(0xe801, fontFamily: 'OutlinedFontIcons')),
            title: Text('Repeat')),
        Divider(indent: 68),
        ListTile(
            leading: Icon(IconData(0xe816, fontFamily: 'OutlinedFontIcons')),
            title: Text('Add note')),
        Divider(indent: 68),
      ]),
    );
  }
}
