import 'package:cubitpractice/models/todo_model.dart';

class TodoState {

  final List<ToDoModel> todos;
  TodoState({
    // required this.name,
    // required this.email,
    required this.todos,
  });

  factory TodoState.initial() => TodoState(
        // name: "",
        // email: "",
        todos: [],
      );

  TodoState copyWith({
    // String? name,
    // String? email,
    List<ToDoModel>? todos,
  }) =>
      TodoState(
        // name: name ?? this.name,
        // email: email ?? this.email,
        todos: todos??this.todos,
      );


}
