import 'package:flutter/material.dart';
import 'package:fluttertodolist/src/models/todo_model.dart';

class CustomDialog extends StatefulWidget {
  final ToDoModel? todo;

  const CustomDialog({super.key, this.todo});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.todo?.title ?? '';
    _contentController.text = widget.todo?.content ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.todo == null ? '추가' : '수정',
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Title',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Content',
              ),
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('취소')),
                ElevatedButton(
                    onPressed: () {
                      final result = ToDoModel(
                          isFinished: false,
                          title: _titleController.text,
                          content: _contentController.text);
                      Navigator.pop(context, result);
                    },
                    child: const Text('확인'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
