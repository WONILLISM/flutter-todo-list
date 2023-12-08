import 'package:flutter/material.dart';
import 'package:fluttertodolist/src/models/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoModel> todos = <ToDoModel>[
    ToDoModel(isFinished: false, title: "할 일 1", content: '내용 1'),
    ToDoModel(isFinished: false, title: "할 일 2", content: '내용 2'),
    ToDoModel(isFinished: false, title: "할 일 3", content: '내용 3'),
    ToDoModel(isFinished: false, title: "할 일 4", content: '내용 4'),
    ToDoModel(isFinished: false, title: "할 일 5", content: '내용 5'),
    ToDoModel(isFinished: false, title: "할 일 6", content: '내용 6'),
    ToDoModel(isFinished: false, title: "할 일 7", content: '내용 7'),
    ToDoModel(isFinished: false, title: "할 일 8", content: '내용 8'),
    ToDoModel(isFinished: false, title: "할 일 9", content: '내용 9'),
    ToDoModel(isFinished: false, title: "할 일 10", content: '내용 10'),
    ToDoModel(isFinished: false, title: "할 일 11", content: '내용 11'),
  ];

  // ToDo 추가
  void addTodo({required ToDoModel todo}) {
    todos.add(todo);
  }

  // ToDo 수정
  void updateTodo({required int idx}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                setState(() {
                  todos.add(ToDoModel(
                      isFinished: false, title: "test", content: "test"));
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListBuilder(list: todos),
    );
  }
}

class ListBuilder extends StatefulWidget {
  final List<ToDoModel> list;

  const ListBuilder({
    super.key,
    required this.list,
  });

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Checkbox(
                onChanged: (v) {
                  setState(() {
                    widget.list[index].isFinished = v!;
                  });
                },
                value: widget.list[index].isFinished),
            title: Text(widget.list[index].title),
            subtitle: Text(widget.list[index].content),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          );
        });
  }
}
