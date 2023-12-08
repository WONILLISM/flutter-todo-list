import 'package:flutter/material.dart';
import 'package:fluttertodolist/src/custom_dialog.dart';
import 'package:fluttertodolist/src/custom_tile.dart';
import 'package:fluttertodolist/src/models/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ToDo List
  List<ToDoModel> todos = <ToDoModel>[
    ToDoModel(isFinished: false, title: "할 일 1", content: '내용 1'),
    ToDoModel(isFinished: true, title: "할 일 2", content: '내용 2'),
    ToDoModel(isFinished: false, title: "할 일 3", content: '내용 3'),
    ToDoModel(isFinished: false, title: "할 일 4", content: '내용 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (BuildContext context) => const CustomDialog(),
                );
                if (result != null) {
                  setState(() {
                    todos.add(result);
                  });
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomTile(item: todos[index]);
        },
      ),
    );
  }
}
