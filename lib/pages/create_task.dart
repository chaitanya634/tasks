// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tasks/providers/lists_handler.dart';

// import '../data/enums.dart';
// import '../data/models.dart';
// import '../data/algos.dart';

// class CreateTaskPage extends StatefulWidget {
//   const CreateTaskPage({
//     Key? key,
//     this.taskIndex,
//   }) : super(key: key);

//   final int? taskIndex;

//   @override
//   State<CreateTaskPage> createState() => _CreateTaskPageState();
// }

// class _CreateTaskPageState extends State<CreateTaskPage> {
//   late TaskModel taskModel;

//   //remainder widget
//   Icon remainderIcon =
//       const Icon(IconData(0xe803, fontFamily: 'OutlinedFontIcons'));
//   Text remainderTitle = const Text('Add remainder');
//   Widget? remainderSubtitle;

//   //due widget
//   Icon dueIcon = const Icon(IconData(0xe80f, fontFamily: 'OutlinedFontIcons'));
//   Widget dueTitle = const Text('Add due date');

//   //repeat widget
//   Icon repeatIcon =
//       const Icon(IconData(0xe801, fontFamily: 'OutlinedFontIcons'));
//   Text repeatTitle = const Text('Repeat');

//   @override
//   void initState() {
//     super.initState();

//     //instatiate task model
//     if (widget.taskIndex != null) {
//       //previous task
//       taskModel = context
//           .read<ListsHandler>()
//           .taskListGroup
//           .singleWhere((element) =>
//               element.key == context.read<ListsHandler>().activeGroupName)
//           .value
//           .singleWhere((element) =>
//               element.key == context.read<ListsHandler>().activeListName)
//           .value
//           .elementAt(widget.taskIndex!);
//     }
//     //new task
//     else {
//       taskModel = TaskModel();
//       taskModel.subtasks = <SubtaskModel>[];
//       if (context.read<ListsHandler>().activeListName ==
//           DefaultLists.Starred.name) {
//         taskModel.isStarred = true;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     ColorScheme colorScheme = Theme.of(context).colorScheme;

//     if (taskModel.remainderDate != null && taskModel.remainderTime != null) {
//       remainderIcon = Icon(
//         Icons.notifications_active_rounded,
//         color: colorScheme.primary,
//       );

//       remainderTitle = Text(
//         'Remind me at ${taskModel.remainderTime!.hourOfPeriod}:${taskModel.remainderTime!.minute} ${taskModel.remainderTime!.period.name}',
//         style: TextStyle(color: colorScheme.primary),
//       );

//       remainderSubtitle = Wrap(
//         children: [
//           Text(
//             '${DaysOfWeek.values[taskModel.remainderDate!.weekday - 1].name}, ',
//             style: TextStyle(color: colorScheme.secondary),
//           ),
//           Text(
//             taskModel.remainderDate!.day.toString(),
//             style: TextStyle(color: colorScheme.secondary),
//           ),
//           Text(
//             ordinal(taskModel.remainderDate!.day),
//             style: TextStyle(
//                 color: colorScheme.secondary,
//                 fontSize: 10,
//                 fontFeatures: const [FontFeature.superscripts()]),
//           ),
//           Text(
//             ' ${Months.values[taskModel.remainderDate!.month - 1].name}',
//             style: TextStyle(color: colorScheme.secondary),
//           ),
//           Text(
//             ' ${taskModel.remainderDate!.year.toString()}',
//             style: TextStyle(color: colorScheme.secondary),
//           ),
//         ],
//       );
//     }

//     if (taskModel.dueDate != null) {
//       dueTitle = Wrap(
//         children: [
//           Text('Due ', style: TextStyle(color: colorScheme.primary)),
//           Text('${DaysOfWeek.values[taskModel.dueDate!.weekday - 1].name}, ',
//               style: TextStyle(color: colorScheme.primary)),
//           Text(taskModel.dueDate!.day.toString(),
//               style: TextStyle(color: colorScheme.primary)),
//           Text(
//             ordinal(taskModel.dueDate!.day),
//             style: TextStyle(
//                 color: colorScheme.primary,
//                 fontSize: 11,
//                 fontFeatures: const [FontFeature.superscripts()]),
//           ),
//           Text(' ${Months.values[taskModel.dueDate!.month - 1].name}',
//               style: TextStyle(color: colorScheme.primary)),
//           Text(' ${taskModel.dueDate!.year.toString()}',
//               style: TextStyle(color: colorScheme.primary)),
//         ],
//       );
//       dueIcon = Icon(Icons.event_rounded, color: colorScheme.primary);
//     }

//     if (taskModel.repeat != null) {
//       repeatTitle = Text('Repeat ${taskModel.repeat!.name}',
//           style: TextStyle(color: colorScheme.primary));
//       repeatIcon = Icon(Icons.event_repeat_rounded, color: colorScheme.primary);
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: colorScheme.secondaryContainer,
//         leading: IconButton(
//           //close button
//           icon: Icon(
//             Icons.close_rounded,
//             color: colorScheme.onSecondaryContainer,
//           ),
//           onPressed: (() {
//             ScaffoldMessenger.of(context).clearSnackBars();
//             Navigator.pop(context);
//           }),
//         ),
//         title: const Text('Create Task'),
//         titleTextStyle: TextStyle(
//           color: colorScheme.onSecondaryContainer,
//           fontSize: 19,
//         ),
//         actions: [
//           //Save button
//           TextButton(
//             child: Text(
//               'Save',
//               style: TextStyle(
//                 color: colorScheme.inverseSurface,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             onPressed: () {
//               //title is not null
//               if (taskModel.title != null) {
//                 //update task
//                 if (widget.taskIndex != null) {
//                   context.read<ListsHandler>().updateTask(widget.taskIndex!, taskModel);
//                 }
//                 //new task
//                 else {
//                   context.read<ListsHandler>().addTask(taskModel);
//                 }
//                 ScaffoldMessenger.of(context).clearSnackBars();
//                 Navigator.pop(context);
//               }
//               //title is null
//               else {
//                 ScaffoldMessenger.of(context).clearSnackBars();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     backgroundColor: colorScheme.primary,
//                     content: Text(
//                       'Please enter title',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: colorScheme.onPrimary,
//                       ),
//                     ),
//                   ),
//                 );
//               }
//             },
//           )
//         ],
//       ),
//       body: ListView(children: [
//         //title textfield
//         Padding(
//           padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
//           child: TextField(
//             controller: TextEditingController(
//               text: taskModel.title,
//             ),
//             onChanged: (value) => taskModel.title = value,
//             decoration: InputDecoration(
//               label: const Text('Title'),
//               prefixIcon: IconButton(
//                 icon: Icon(
//                   taskModel.isStarred
//                       ? Icons.star_rounded
//                       : Icons.star_border_rounded,
//                   color: taskModel.isStarred ? colorScheme.primary : null,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     taskModel.isStarred
//                         ? taskModel.isStarred = false
//                         : taskModel.isStarred = true;
//                   });
//                 },
//               ),
//               suffixIcon: Checkbox(
//                 checkColor: colorScheme.onPrimary,
//                 activeColor: colorScheme.primary,
//                 value: taskModel.isChecked,
//                 onChanged: (value) {
//                   setState(() {
//                     taskModel.isChecked = value!;
//                   });
//                 },
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: colorScheme.outline),
//                 borderRadius: BorderRadius.circular(18),
//               ),
//             ),
//           ),
//         ),

//         // Subtask list
//         Padding(
//           padding: const EdgeInsets.only(left: 46, right: 8),
//           child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: taskModel.subtasks!.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(top: 8),
//                 child: TextField(
//                   controller: TextEditingController(
//                     text: taskModel.subtasks!.elementAt(index).title,
//                   ),
//                   onChanged: (value) {
//                     taskModel.subtasks!.elementAt(index).title = value;
//                   },
//                   decoration: InputDecoration(
//                       label: const Text('Subtitle'),
//                       suffixIcon:
//                           Row(mainAxisSize: MainAxisSize.min, children: [
//                         Checkbox(
//                             checkColor: colorScheme.onSecondary,
//                             activeColor: colorScheme.secondary,
//                             value:
//                                 taskModel.subtasks!.elementAt(index).isChecked,
//                             onChanged: (value) {
//                               setState(() {
//                                 taskModel.subtasks!.elementAt(index).isChecked =
//                                     value!;
//                               });
//                             },
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             )),
//                         IconButton(
//                             icon: const Icon(Icons.close_rounded),
//                             onPressed: () {
//                               setState(() {
//                                 taskModel.subtasks!.removeAt(index);
//                               });
//                             }),
//                       ]),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18))),
//                 ),
//               );
//             },
//           ),
//         ),

//         //Add Subtask Button
//         Align(
//           alignment: Alignment.centerRight,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: OutlinedButton.icon(
//               onPressed: () {
//                 setState(() {
//                   taskModel.subtasks!.add(SubtaskModel());
//                 });
//               },
//               icon:
//                   const Icon(IconData(0xe811, fontFamily: 'OutlinedFontIcons')),
//               label: const Text('Subtask'),
//             ),
//           ),
//         ),

//         const SizedBox(
//           height: 8,
//         ),

//         const Divider(
//           indent: 138,
//           endIndent: 138,
//           height: 1,
//         ),

//         //Remainder
//         ListTile(
//           minVerticalPadding: 18,
//           leading: SizedBox(
//             height: double.infinity,
//             child: remainderIcon,
//           ),
//           title: remainderTitle,
//           subtitle: remainderSubtitle,
//           onTap: () async {
//             DateTime? date = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime.now(),
//               lastDate: DateTime(DateTime.now().year + 10),
//             );
//             TimeOfDay? time = await showTimePicker(
//               context: context,
//               initialTime: TimeOfDay.now(),
//               builder: (context, child) {
//                 return Theme(
//                   data: Theme.of(context),
//                   child: child!,
//                 );
//               },
//             );

//             taskModel.remainderDate = date;
//             taskModel.remainderTime = time;

//             setState(() {
//               remainderIcon = Icon(
//                 Icons.notifications_active_rounded,
//                 color: colorScheme.primary,
//               );

//               remainderTitle = Text(
//                 'Remind me at ${time?.hourOfPeriod}:${time?.minute} ${time?.period.name}',
//                 style: TextStyle(color: colorScheme.primary),
//               );

//               remainderSubtitle = Wrap(
//                 children: [
//                   Text(
//                     '${DaysOfWeek.values[date!.weekday - 1].name}, ',
//                     style: TextStyle(color: colorScheme.secondary),
//                   ),
//                   Text(
//                     date.day.toString(),
//                     style: TextStyle(color: colorScheme.secondary),
//                   ),
//                   Text(
//                     ordinal(date.day),
//                     style: TextStyle(
//                         color: colorScheme.secondary,
//                         fontSize: 10,
//                         fontFeatures: const [FontFeature.superscripts()]),
//                   ),
//                   Text(
//                     ' ${Months.values[date.month - 1].name}',
//                     style: TextStyle(color: colorScheme.secondary),
//                   ),
//                   Text(
//                     ' ${date.year.toString()}',
//                     style: TextStyle(color: colorScheme.secondary),
//                   ),
//                 ],
//               );
//             });
//           },
//         ),
//         const Divider(
//           indent: 68,
//           height: 1,
//         ),

//         //Due
//         ListTile(
//           minVerticalPadding: 18,
//           leading: dueIcon,
//           title: dueTitle,
//           onTap: () async {
//             DateTime? date = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime.now(),
//               lastDate: DateTime(DateTime.now().year + 10),
//             );
//             taskModel.dueDate = date;
//             setState(() {
//               dueTitle = Wrap(
//                 children: [
//                   Text('Due ', style: TextStyle(color: colorScheme.primary)),
//                   Text('${DaysOfWeek.values[date!.weekday - 1].name}, ',
//                       style: TextStyle(color: colorScheme.primary)),
//                   Text(date.day.toString(),
//                       style: TextStyle(color: colorScheme.primary)),
//                   Text(
//                     ordinal(date.day),
//                     style: TextStyle(
//                         color: colorScheme.primary,
//                         fontSize: 11,
//                         fontFeatures: const [FontFeature.superscripts()]),
//                   ),
//                   Text(' ${Months.values[date.month - 1].name}',
//                       style: TextStyle(color: colorScheme.primary)),
//                   Text(' ${date.year.toString()}',
//                       style: TextStyle(color: colorScheme.primary)),
//                 ],
//               );
//               dueIcon = Icon(Icons.event_rounded, color: colorScheme.primary);
//             });
//           },
//         ),
//         const Divider(
//           indent: 68,
//           height: 1,
//         ),

//         //Repeat
//         PopupMenuButton<RepeatTask>(
//           offset: const Offset(1, 0),
//           child: ListTile(
//             minVerticalPadding: 18,
//             leading: repeatIcon,
//             title: repeatTitle,
//           ),
//           itemBuilder: (BuildContext context) => <PopupMenuEntry<RepeatTask>>[
//             PopupMenuItem(
//                 value: RepeatTask.Daily, child: Text(RepeatTask.Daily.name)),
//             PopupMenuItem(
//                 value: RepeatTask.Monthly,
//                 child: Text(RepeatTask.Monthly.name)),
//             PopupMenuItem(
//                 value: RepeatTask.Weekday,
//                 child: Text(RepeatTask.Weekday.name)),
//             PopupMenuItem(
//                 value: RepeatTask.Weekend,
//                 child: Text(RepeatTask.Weekend.name)),
//             PopupMenuItem(
//                 value: RepeatTask.Weekly, child: Text(RepeatTask.Weekly.name)),
//             PopupMenuItem(
//                 value: RepeatTask.Yearly, child: Text(RepeatTask.Yearly.name)),
//           ],
//           onSelected: (value) {
//             setState(() {
//               taskModel.repeat = value;
//               repeatTitle = Text('Repeat ${value.name}',
//                   style: TextStyle(color: colorScheme.primary));
//               repeatIcon =
//                   Icon(Icons.event_repeat_rounded, color: colorScheme.primary);
//             });
//           },
//         ),
//         const Divider(
//           indent: 68,
//           height: 1,
//         ),

//         //Delete
//         Visibility(
//           visible: widget.taskIndex == null ? false : true,
//           child: ListTile(
//             minVerticalPadding: 18,
//             leading: Icon(
//               const IconData(0xe800, fontFamily: 'DeleteFontIcon'),
//               color: colorScheme.error,
//             ),
//             title:
//                 Text('Delete Task', style: TextStyle(color: colorScheme.error)),
//             onTap: () {
//               context.read<ListsHandler>().removeTaskAt(widget.taskIndex!);
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         Visibility(
//           visible: widget.taskIndex == null ? false : true,
//           child: const Divider(indent: 68),
//         ),

//         //Note
//         // ListTile(
//         //     leading: Icon(IconData(0xe816, fontFamily: 'OutlinedFontIcons')),
//         //     title: Text('Add note')),
//         // const Divider(indent: 68),
//       ]),
//     );
//   }
// }
