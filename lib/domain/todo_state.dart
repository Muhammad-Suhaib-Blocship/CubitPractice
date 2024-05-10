import 'package:cubitpractice/models/todo_model.dart';

/// state => initial state, loading state, loaded state, error state
//
// abstract class PRState {}
//
// class InitialState extends PRState {
//   InitialState();
// }
//
// class LoadingState extends PRState {
//   LoadingState();
// }
//
// class LoadedState extends PRState {
//   LoadedState();
// }
//
// class ErrorState extends PRState {
//   ErrorState();
// }
//
// class PRCubit extends Cubit<PRState> {
//   PRCubit() : super(InitialState());
//
//   void getTodos() {
//     emit(LoadingState());
//     try {
//       // api call
//       emit(LoadedState());
//     } catch (e) {
//       emit(ErrorState());
//     }
//
//     emit(LoadedState());
//     // final tempList = [...state.todos];
//     // tempList.add(ToDoModel(name: name, email: email));
//     // // tempList.add(email);
//     // print(tempList);
//     // emit(state.copyWith(todos: tempList));
//   }
// }

class TodoState {
  final List<ToDoModel> todos;

  TodoState({required this.todos});

  factory TodoState.initial() => TodoState(todos: []);

  TodoState copyWith({List<ToDoModel>? todos}) =>
      TodoState(todos: todos ?? this.todos);
}
