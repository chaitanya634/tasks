import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../data/algos.dart';
import '../data/enums.dart';
import 'collections.dart';

class CollectionsProvider with ChangeNotifier {
  late Isar isar;
  late Widget homePageAppBarTitle;
  late String activeGroupName;
  late String activeListName;

  CollectionsProvider(this.isar) {
    initIsar();
    activeGroupName = DefaultListGroup.main.name;
    activeListName = DefaultLists.myDay.name;
    setCurrentDayAppBarTitle();
  }

  void initIsar() async {
    //create default groups
    int numGroups = await isar.groups.count();
    if (numGroups == 0) {
      var mainGroup = Group()..name = DefaultListGroup.main.name;
      var officeGroup = Group()..name = DefaultListGroup.office.name;
      isar.writeTxn(() async {
        isar.groups.putAll([mainGroup, officeGroup]);
      });
    }

    //create default lists
    int numLists = await isar.taskLists.count();
    if (numLists == 0) {
      var defaultLists = [
        TaskList()
          ..groupName = DefaultListGroup.main.name
          ..name = DefaultLists.myDay.name,
        TaskList()
          ..groupName = DefaultListGroup.main.name
          ..name = DefaultLists.planned.name,
        TaskList()
          ..groupName = DefaultListGroup.main.name
          ..name = DefaultLists.starred.name,
        TaskList()
          ..groupName = DefaultListGroup.main.name
          ..name = DefaultLists.shopping.name,
        TaskList()
          ..groupName = DefaultListGroup.main.name
          ..name = DefaultLists.ideas.name,
        TaskList()
          ..groupName = DefaultListGroup.main.name
          ..name = DefaultLists.plans.name,
      ];

      isar.writeTxn(() async {
        isar.taskLists.putAll(defaultLists);

        var mainGroup = await isar.groups
            .where()
            .filter()
            .nameEqualTo(DefaultListGroup.main.name)
            .findFirst();
        await mainGroup!.lists.load();
        mainGroup.lists.addAll(defaultLists);
        await mainGroup.lists.save();

        //test--
        isar.tasks.put(Task()
          ..groupName = activeGroupName
          ..listName = activeListName
          ..title = 'task 1'
          ..isStarred = true
          ..isChecked = true
          ..remainder = DateTime.now()
          ..due = DateTime.now()
          ..repeatTask = RepeatTask.Daily.index
          ..note = 'test task');
      });
    }
  }

  //work with app bar
  void setCurrentDayAppBarTitle() {
    homePageAppBarTitle = Builder(
      builder: (context) {
        ColorScheme colorScheme = Theme.of(context).colorScheme;
        DateTime currentDateTime = DateTime.now();
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            Text(
              DaysOfWeek.values[currentDateTime.weekday - 1].name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: colorScheme.primary,
              ),
            ),
            //Subtitle
            Wrap(
              children: [
                Text(
                  currentDateTime.day.toString(),
                  style: TextStyle(
                    color: colorScheme.secondary,
                    fontSize: 10,
                  ),
                ),
                Text(
                  ordinal(currentDateTime.day),
                  style: TextStyle(
                    color: colorScheme.secondary,
                    fontSize: 6,
                    fontFeatures: const [FontFeature.superscripts()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    Months.values[currentDateTime.month - 1].name,
                    style: TextStyle(
                      color: colorScheme.secondary,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
    notifyListeners();
  }

  void setCustomAppBarTitle(String title) {
    homePageAppBarTitle = Builder(
      builder: (context) {
        ColorScheme colorScheme = Theme.of(context).colorScheme;
        return Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: colorScheme.primary,
          ),
        );
      },
    );
    notifyListeners();
  }

  //work with tasks
  Stream<List<Task>> getTasks() {
    return isar.tasks
        .filter()
        .groupNameEqualTo(activeGroupName)
        .and()
        .listNameEqualTo(activeListName)
        .watch(fireImmediately: true);
  }

  void updateTaskChecked(bool checkValue, String title) async {
    var task = await isar.tasks.getByTitle(title);
    task!.isChecked = checkValue;
    await isar.writeTxn(() async => await isar.tasks.putByTitle(task));
    notifyListeners();
  }
}
