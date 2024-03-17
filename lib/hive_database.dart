import 'package:hive/hive.dart';

class TodoDatabase {
  List toDoList = [];

  final _myBox = Hive.box("mybox");

  void createInitialData() {
    toDoList = [
      ['Make a tutorial', false],
      ['Do exercise', false]
    ];
  }

  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDatabase(){
    _myBox.put('TODOLIST', toDoList);
  }
}
