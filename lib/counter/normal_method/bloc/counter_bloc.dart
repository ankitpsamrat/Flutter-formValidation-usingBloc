// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(CounterInitialState()) {
    on<CounterIncreaseEvent>(onCounterIncrease);
    on<CounterDecreaseEvent>(onCounterDecrease);
  }

  void onCounterIncrease(
    CounterIncreaseEvent event,
    Emitter<CounterState> emit,
  ) {
    counter = counter + 1;
    emit(CounterUpdateState(counter: counter));
  }

  void onCounterDecrease(
    CounterDecreaseEvent event,
    Emitter<CounterState> emit,
  ) {
    counter = counter - 1;
    emit(CounterUpdateState(counter: counter));
  }
}
