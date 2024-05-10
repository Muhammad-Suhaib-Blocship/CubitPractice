import 'package:bloc/bloc.dart';
import 'package:cubitpractice/domain/todo_state.dart';
import 'package:cubitpractice/models/todo_model.dart';

class ToDoCubit extends Cubit<TodoState> {
  ToDoCubit() : super(TodoState.initial());
  //logic ya function

  void addTodos({required String name, required String email}) {
    final tempList = [...state.todos];
    tempList.add(ToDoModel(name: name, email: email));
    // tempList.add(email);
    print(tempList);
    emit(state.copyWith(todos: tempList));
  }

  void deleteTodos({required int index}) {
    final deleteListTemp = [...state.todos];
    deleteListTemp.removeAt(index);
    emit(state.copyWith(todos: deleteListTemp));
  }

  void updateTodos(
      {required int index, required String name, required String email}) {
    final updatedList = [...state.todos];

    updatedList[index] = ToDoModel(name: name, email: email);
    print("updatedList : $updatedList");
    emit(state.copyWith(todos: updatedList));
  }
}
