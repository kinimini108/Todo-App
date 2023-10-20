// ignore_for_file: unused_field

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List toDoList = [];
  final _myBox = Hive.box('mybox');
  // first time opening the app
  void createData() {
    toDoList = [
      ["Watch Tutorial", false],
      ["Make Tutorial", false],
    ];
  }

//  load
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

// update
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
