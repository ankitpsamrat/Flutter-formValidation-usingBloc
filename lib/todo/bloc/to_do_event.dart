part of 'to_do_bloc.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

final class AddToDoEvent extends ToDoEvent {
  final String title;

  const AddToDoEvent({required this.title});

  @override
  List<Object> get props => [title];
}

final class EditToDoEvent extends ToDoEvent {
  final String id;
  final String newTitle;

  const EditToDoEvent({required this.id, required this.newTitle});

  @override
  List<Object> get props => [id, newTitle];
}

final class DeleteToDoEvent extends ToDoEvent {
  final String id;

  const DeleteToDoEvent({required this.id});

  @override
  List<Object> get props => [id];
}
