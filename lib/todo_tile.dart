import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class toDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  toDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Checkbox(activeColor: Colors.black,
                    value: taskCompleted, onChanged: onChanged),
                Text(
                  taskName,
                  style: TextStyle(fontSize: 22,decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.green[400], borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
