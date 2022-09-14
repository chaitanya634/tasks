// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../data/models.dart';

class ListGroupsHandler with ChangeNotifier {
  late List<MapEntry<String, List<MapEntry<String, List<TaskModel>>>>> myGroups;

  ListGroupsHandler() {
    myGroups = [];
    myGroups.add(MapEntry('Office', []));
  }

  bool addGroup(MapEntry<String, List<MapEntry<String, List<TaskModel>>>> group) {
    myGroups.add(group);
    notifyListeners();
    return myGroups.contains(group);
  }
}
