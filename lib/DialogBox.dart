import 'package:flutter/material.dart';
import 'package:todo_app/My_Button.dart';

class DialogBox extends StatelessWidget {

  final Controller;
  VoidCallback onSaved;
  VoidCallback onCancel;

  DialogBox({super.key, required this.Controller, required this.onSaved, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[200],
      content: Container(
        height: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(
                controller: Controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Add a new Task'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(text: "Cancel", onPressed: onCancel),
                  MyButton(text: "Save", onPressed: onSaved)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
