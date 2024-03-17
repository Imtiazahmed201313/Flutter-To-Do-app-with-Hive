import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/DialogBox.dart';
import 'package:todo_app/hive_database.dart';
import 'package:todo_app/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _myBox = Hive.box('mybox');

  final _controller = TextEditingController();

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if(_myBox.get('TODOLIST') == null){
      db.createInitialData();
    }else{
      db.loadData();
    }

    super.initState();
  }

  void onChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateDatabase();
  }

  void createTask() {
    showDialog(context: context, builder: (context) {
      return DialogBox(Controller: _controller,
        onCancel: () => Navigator.of(context).pop(),
        onSaved: saveNewTask,
      );
    });
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        centerTitle: true,
        title: Text(
          "To Do App",
          style: TextStyle(color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return toDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => onChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add, size: 40,),
        onPressed: () {
          createTask();
        },
      ),
    );
  }
}
