// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../data/models.dart';

class MyGroups with ChangeNotifier {
  late List<MapEntry<String, List<MapEntry<String, List<TaskModel>>>>> myGroups;

  MyGroups() {
    myGroups = [];
    myGroups.add(MapEntry('Office', []));
  }

  bool addGroup(MapEntry<String, List<MapEntry<String, List<TaskModel>>>> group) {
    myGroups.add(group);
    notifyListeners();
    return myGroups.contains(group);
  }
}
