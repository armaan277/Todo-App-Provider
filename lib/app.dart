import 'package:flutter/material.dart';
import 'package:israr_bhai_task/todo_app_screen.dart';
import 'package:israr_bhai_task/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MaterialApp(
        home: TodoAppScreen(),
      ),
    );
  }
}