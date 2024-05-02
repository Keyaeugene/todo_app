import 'package:app/api/api.dart';
import 'package:app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final todoTitleController = TextEditingController();
  final todoDesController = TextEditingController();

  void onAdd() {
    final String textVal = todoTitleController.text;
    final String desVal = todoDesController.text;

    if (textVal.isNotEmpty && desVal.isNotEmpty) {
      final Todo todo = Todo(title: textVal, description: desVal, id: 1);
      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Add Todo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: todoTitleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Title",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: todoDesController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Description",
                ),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: onAdd,
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
