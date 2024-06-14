import 'package:flutter/material.dart';
import 'package:israr_bhai_task/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoAppScreen extends StatelessWidget {
  const TodoAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('BuildContext build()');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasker App Provider'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TodoProvider>(builder: (context, todo, child) {
          debugPrint('Consumer build()');
          return Column(
            children: [
              TextField(
                controller: todo.titleTEC,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  hintText: 'Enter Title...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: todo.descriptionTEC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Description'),
                  hintText: 'Enter Description...',
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String task = todo.titleTEC.text;
                    String desTask = todo.descriptionTEC.text;
                    todo.addTask(task, desTask, todo.editIndex);
                  },
                  child: Text(todo.isEditingController ? 'Update' : 'Save'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todo.title.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                            value: todo.isCompleted,
                            onChanged: (value) {
                              todo.isCompletedTask(value);
                            }),
                        title: Text(
                          todo.title[index],
                          style: TextStyle(
                            decoration: todo.isCompleted == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text(todo.description[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                todo.editTask(index);
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                todo.removeTask(index);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
