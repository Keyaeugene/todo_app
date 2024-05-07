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
            final todo = todoP.todos[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          todoP.deleteTodo(
                              todo); // Delete the todo item when the delete button is pressed
                        },
                      ),
                      title: Text(
                        todo.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.black,
                            value: todo.isChecked,
                            onChanged: (newValue) {
                              todo.isChecked = newValue ?? false;
                              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                              todoP.notifyListeners();
                            },
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              todo.description,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 0), // Add space between each tile
              ],
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
