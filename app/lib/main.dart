import 'package:app/api/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/add_todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: todoP.todos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(todoP.todos[index].title),
              subtitle: Text(
                (todoP.todos[index].description),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(150, 29, 170, 1),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const AddTodoScreen()),
            );
          },
          label: const Text('Add'),
          icon: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ));
  }
}
