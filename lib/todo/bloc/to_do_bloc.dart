import 'package:bloc/bloc.dart';
import 'package:bloc_package/todo/models/todo_model.dart';
import 'package:equatable/equatable.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoInitial()) {
    on<AddToDoEvent>(_onAddTodo);
    on<EditToDoEvent>(_onEditTodo);
    on<DeleteToDoEvent>(_onDeleteTodos);
  }

  void _onAddTodo(AddToDoEvent event, Emitter<ToDoState> emit) {
    final currentTodos = _currentTodos();

    final newTodo = ToDoModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: event.title,
    );

    emit(ToDoLoaded(todos: [...currentTodos, newTodo]));
  }

  void _onEditTodo(EditToDoEvent event, Emitter<ToDoState> emit) {
    final currentTodos = _currentTodos();

    final updatedTodos = currentTodos.map((todo) {
      return todo.id == event.id ? todo.copyWith(title: event.newTitle) : todo;
    }).toList();

    emit(ToDoLoaded(todos: updatedTodos));
  }

  void _onDeleteTodos(DeleteToDoEvent event, Emitter<ToDoState> emit) {
    final currentTodos = _currentTodos();

    final updatedTodos = currentTodos.where((e) => e.id != event.id).toList();

    emit(ToDoLoaded(todos: updatedTodos));
  }

  List<ToDoModel> _currentTodos() {
    final ToDoState state = this.state;

    return state is ToDoLoaded ? state.todos : [];
  }
}
