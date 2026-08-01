import 'package:equatable/equatable.dart';

class ToDoModel extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;

  const ToDoModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  ToDoModel copyWith({String? title, bool? isCompleted}) {
    return ToDoModel(
      id: id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [id, title, isCompleted];
}
