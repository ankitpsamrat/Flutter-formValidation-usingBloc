import 'package:bloc_package/todo/bloc/to_do_bloc.dart';
import 'package:bloc_package/todo/models/todo_model.dart';
import 'package:bloc_package/todo/screens/add_edit_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Todo Home'),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              AddEditModal.show(context);
            },
            icon: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          final List<ToDoModel> todos = state is ToDoLoaded
              ? state.todos
              : <ToDoModel>[];

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final ToDoModel todo = todos[index];

              return ListTile(
                contentPadding: const EdgeInsets.only(left: 15),
                title: Text(todo.title),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        AddEditModal.show(context, todo: todo);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<ToDoBloc>().add(
                          DeleteToDoEvent(id: todo.id),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
