import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);


  void increment() {
    final val = state + 1;
    emit(val);
  }

  /*void increment(int value) {
    value = value + 1;
    emit(value);
  }*/

}
