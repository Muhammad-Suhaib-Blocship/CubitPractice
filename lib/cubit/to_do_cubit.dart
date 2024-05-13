import 'package:bloc/bloc.dart';
import 'package:cubitpractice/domain/cubit_state.dart';
import 'package:cubitpractice/domain/todo_state.dart';
import 'package:cubitpractice/models/todo_model.dart';

class ToDoCubit extends Cubit<CubitState<TodoState>> {
  ToDoCubit() : super(const InitialState());

  //logic ya function
  final List<ToDoModel> tempList = [];
  void addTodos({required String name, required String email}) {
    emit(const LoadingState());

    tempList.add(ToDoModel(name: name, email: email));
    print(tempList);

    final todoState = TodoState(todos: [...tempList]);

    emit(LoadedState(todoState));
  }

  void deleteTodos({required int index}) {
    emit(const LoadingState());

    tempList.removeAt(index);
    final deleteState = TodoState(todos: [...tempList]);

    emit(LoadedState(deleteState));
  }

  void updateTodos(
      {required int index, required String name, required String email}) {
    emit(const LoadingState());

    tempList[index] = ToDoModel(name: name, email: email);
    final updatedState = TodoState(todos: [...tempList]);
    print("updatedList : $tempList");

    emit(LoadedState(updatedState));
  }
}
