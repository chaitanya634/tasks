// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../data/models.dart';

class MyLists with ChangeNotifier {
  late List<MapEntry<String, List<TaskModel>>> myLists;

  MyLists() {
    myLists = [];
    myLists.add(MapEntry('Shopping', []));
    myLists.add(MapEntry('Ideas', []));
    myLists.add(MapEntry('Plans', []));
  }

  bool addList(MapEntry<String, List<TaskModel>> listMap) {
    myLists.add(listMap);
    notifyListeners();
    return myLists.contains(listMap);
  }

  void removeAt(int index) {
    myLists.removeAt(index);
    notifyListeners();
  }

}
