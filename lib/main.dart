// import 'package:flutter/cupertino.dart';
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:todo_app/Examples/home_todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // init the Hive
  await Hive.initFlutter();

  // open a Box
  void box = await Hive.openBox('mybox');

  runApp(
    MaterialApp(
      home: const HomeTodo(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
