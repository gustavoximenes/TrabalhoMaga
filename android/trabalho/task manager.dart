import 'package:flutter/material.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Map<String, dynamic>> tasks = [
    {"id": 1, "title": "Tarefa 1", "description": "Descrição da Tarefa 1", "completed": false},
    {"id": 2, "title": "Tarefa 2", "description": "Descrição da Tarefa 2", "completed": true},
    {"id": 3, "title": "Tarefa 3", "description": "Descrição da Tarefa 3", "completed": false},
  ];

  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tarefas")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(
              task['title'],
              style: TextStyle(
                decoration: task['completed'] ? TextDecoration.lineThrough : null,
                color: task['completed'] ? Colors.grey : Colors.black,
              ),
            ),
            subtitle: Text(task['description']),
            leading: Icon(
              task['completed'] ? Icons.check_circle : Icons.radio_button_unchecked,
              color: task['completed'] ? Colors.green : Colors.grey,
            ),
            onTap: () => toggleTaskCompletion(index),
          );
        },
      ),
    );
  }
}