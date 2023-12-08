import 'package:flutter/material.dart';
import 'package:fluttertodolist/src/custom_dialog.dart';
import 'package:fluttertodolist/src/models/todo_model.dart';

class CustomTile extends StatefulWidget {
  const CustomTile({
    super.key,
    required this.item,
  });

  final ToDoModel item;

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  late ToDoModel item;

  bool isChecked = false;

  @override
  void initState() {
    item = widget.item;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: (e) {
          setState(() {
            isChecked = !isChecked;
          });
        },
        value: isChecked,
      ),
      title: Text(item.title),
      subtitle: Text(item.content),
      trailing: IconButton(
        onPressed: () async {
          final result = await showDialog<ToDoModel?>(
            context: context,
            builder: (BuildContext context) => CustomDialog(todo: item),
          );
          if (result != null) {
            setState(() {
              item = result;
            });
          }
        },
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
