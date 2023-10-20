// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/Examples/util/my_botton.dart';

class DialogBoxs extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBoxs(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: const Color(0xfffaae7b),
        // ignore: sized_box_for_whitespace
        content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add New Task",
                ),
              ),
              // buttons => save + cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Save buttons
                  MyBotton(text: "Save", onPressed: onSave),
                  // Cancel button
                  MyBotton(text: "Cancel", onPressed: onCancel)
                ],
              )
            ],
          ),
        ));
  }
}
