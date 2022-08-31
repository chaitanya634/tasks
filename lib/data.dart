import 'package:flutter/material.dart';

class Tasks {

}

class MyData {
  static List<MapEntry<String, Tasks>> myLists = [MapEntry('name', Tasks())];
  static List<MapEntry<String, Map<String, Tasks>>> myFolders = [];

}
