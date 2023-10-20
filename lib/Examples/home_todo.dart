// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/Examples/util/dialog_box.dart';
import 'package:todo_app/Examples/util/todo_tile.dart';
import 'package:todo_app/data/todo_data.dart';

class HomeTodo extends StatefulWidget {
  const HomeTodo({super.key});

  @override
  State<HomeTodo> createState() => _HomeTodoState();
}

class _HomeTodoState extends State<HomeTodo> {
  // Databases
  final _myBox = Hive.box('mybox');
  TodoDataBase db = TodoDataBase();

  // mytext controller
  final _controller = TextEditingController();
  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //onsave method
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

//Creating new Task if you touch the botton
  void creatNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBoxs(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
    db.updateData();
  }

// checkbox was tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // Delete Task
  void deletTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff392d69),
      appBar: AppBar(
        backgroundColor: const Color(0xfffaae7b),
        elevation: 0,
        title: const Center(
          child: Text('Todo App'),
        ),
      ),

      // Button add
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        backgroundColor: const Color(0xfffaae7b),
        child: const Icon(CupertinoIcons.add),
      ),

      // The tasks
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskComplete: db.toDoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFunction: (context) => deletTask(index),
          );
        },
      ),
    );
  }
}
