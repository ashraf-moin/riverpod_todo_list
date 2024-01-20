import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_list/data/todo_model.dart';
import 'package:riverpod_todo_list/providers/todo_provider.dart';
class DialogUtils {
  static void showAddTodoDialog(BuildContext context, WidgetRef ref) {
    TextEditingController _textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Todo List"),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: "Write a List"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  ref.read(todoListProvider.notifier).addTodo(
                    TODOModel(
                      title: _textController.text,
                      isCompleted: false,
                    ),
                  );
                  _textController.clear();
                }
                Navigator.pop(context);
              },
              child: Text("Submit"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}