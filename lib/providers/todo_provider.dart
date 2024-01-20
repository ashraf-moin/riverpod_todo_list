import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/todo_model.dart';

final todoListProvider = StateNotifierProvider<TodoList, List<TODOModel>>(
      (ref) => TodoList(),
  name: 'todoListProvider',
);

class TodoList extends StateNotifier<List<TODOModel>> {
  TodoList() : super([]);

  Future<void> loadTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? todoListStrings = prefs.getStringList('todoList');
    state = todoListStrings?.map((jsonString) =>
        TODOModel.fromJsonString(jsonString)).toList() ?? [];
  }

  Future<void> saveTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> todoListStrings = state.map((task) =>
        task.toJsonString()).toList();
    await prefs.setStringList('todoList', todoListStrings);
  }

  void addTodo(TODOModel todo) {
    state = [...state, todo];
    saveTodoList();
  }

  void removeTodo(TODOModel todo) {
    state = state.where((t) => t != todo).toList();
    saveTodoList();
  }

  void toggleTodoStatus(TODOModel todo) {
    final index = state.indexOf(todo);
    if (index != -1) {
      state[index] = TODOModel(
        title: todo.title,
        isCompleted: !todo.isCompleted,
      );
      saveTodoList();

    }
  }
}


