import 'package:bloc_package/todo/bloc/to_do_bloc.dart';
import 'package:bloc_package/todo/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditModal extends StatefulWidget {
  final ToDoModel? todo;

  const AddEditModal({super.key, this.todo});

  static show(BuildContext context, {ToDoModel? todo}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddEditModal(todo: todo);
      },
    );
  }

  @override
  State<AddEditModal> createState() => _AddEditModalState();
}

class _AddEditModalState extends State<AddEditModal> {
  //

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _controller.text = widget.todo?.title ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Enter Todo',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (widget.todo == null) {
                context.read<ToDoBloc>().add(
                  AddToDoEvent(title: _controller.text.trim()),
                );
              } else {
                context.read<ToDoBloc>().add(
                  EditToDoEvent(
                    id: widget.todo!.id,
                    newTitle: _controller.text.trim(),
                  ),
                );
              }
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
