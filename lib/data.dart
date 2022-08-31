import 'package:flutter/material.dart';

class Tasks {}

class MyData {
  static List<MapEntry<String, Tasks>> myLists = [
    MapEntry('List 1', Tasks()),
    MapEntry('List 2', Tasks()),
    MapEntry('List 3', Tasks()),
  ];

  static List<MapEntry<String, List<MapEntry<String, Tasks>>>> myFolders = [
    MapEntry('Group 1', [
      MapEntry('G List 1', Tasks()),
      MapEntry('G List 2', Tasks()),
      MapEntry('G List 3', Tasks()),
    ]),
    MapEntry('Group 1', [
      MapEntry('G List 1', Tasks()),
      MapEntry('G List 2', Tasks()),
      MapEntry('G List 3', Tasks()),
    ]),
  ];
}


