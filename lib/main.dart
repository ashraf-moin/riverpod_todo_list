import 'package:flutter/material.dart';
import 'package:riverpod_todo_list/app/todo_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Main Function
void main() {
  runApp(
    const ProviderScope(
      child: TodoApp(),
    ),
  );
}
