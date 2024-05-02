import 'package:app/api/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/add_todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            'Todo App',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: todoP.todos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  todoP.deleteTodo(todoP.todos[index]);
                },
              ),
              title: Text(
                todoP.todos[index].title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                (todoP.todos[index].description),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const AddTodoScreen()),
            );
          },
          label: const Text(
            'Add',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
