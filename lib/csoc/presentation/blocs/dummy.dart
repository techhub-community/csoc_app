import 'package:bloc/bloc.dart';

class Dummy extends Cubit<int> {

  Dummy() :super(0);//initial state

  //state and emit are used to access the current state and update the state respectively
  //like notify listeners

  void inc()=>emit(state+1);
}
