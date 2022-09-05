import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/providers/date_time.dart';

import '../data.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage(this.lightDynamic, {Key? key}) : super(key: key);
  final ColorScheme? lightDynamic;
  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  bool starred = false, checked = false;

  Widget? rTitle = const Text('Add reaminder'), rSubtitle;

  @override
  void initState() {
    super.initState();
  }

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
        //Add task textfield
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
          child: TextField(
            decoration: InputDecoration(
                label: const Text('Title'),
                prefixIcon: IconButton(
                  icon: Icon(
                    starred ? Icons.star_rounded : Icons.star_border_rounded,
                    color:
                        starred ? Theme.of(context).colorScheme.primary : null,
                  ),
                  onPressed: () {
                    setState(() {
                      starred ? starred = false : starred = true;
                    });
                    debugPrint('Starred');
                  },
                ),
                suffixIcon: IconButton(
                  icon: Checkbox(
                      checkColor: Theme.of(context).colorScheme.onPrimary,
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: checked,
                      onChanged: (value) {
                        setState(() {
                          checked = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    debugPrint('Pressed');
                  },
                ),
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
            itemCount: context.watch<MyData>().subtasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: TextField(
                  onChanged: (value) {
                    context.read<MyData>().updateSubtaskTitle(value, index);
                  },
                  decoration: InputDecoration(
                      label: const Text('Subtitle'),
                      suffixIcon:
                          Row(mainAxisSize: MainAxisSize.min, children: [
                        Checkbox(
                            value: context
                                .watch<MyData>()
                                .subtasks
                                .elementAt(index)
                                .isChecked,
                            onChanged: (value) {
                              context
                                  .read<MyData>()
                                  .updateSubtaskCheckbox(value!, index);
                              debugPrint(
                                  '${context.read<MyData>().subtasks.elementAt(index).title}, ${context.read<MyData>().subtasks.elementAt(index).isChecked.toString()}');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        IconButton(
                            icon: const Icon(
                              Icons.close_rounded,
                            ),
                            onPressed: () {
                              context
                                  .read<MyData>()
                                  .removeSubtaskAt(index: index);
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
                context.read<MyData>().addSubtask(subtaskModel: SubtaskModel());
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
        ListTile(
          leading: Container(
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
                  Text(
                      '${context.read<DateTimeProvider>().weekday(date!.weekday)}, '),
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
