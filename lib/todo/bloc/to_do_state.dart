part of 'to_do_bloc.dart';

sealed class ToDoState extends Equatable {
  const ToDoState();

  @override
  List<Object> get props => [];
}

final class ToDoInitial extends ToDoState {}

final class ToDoLoaded extends ToDoState {
  final List<ToDoModel> todos;

  const ToDoLoaded({required this.todos});

  @override
  List<Object> get props => [todos];
}
