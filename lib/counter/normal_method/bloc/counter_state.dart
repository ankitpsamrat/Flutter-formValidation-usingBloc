part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitialState extends CounterState {}

class CounterUpdateState extends CounterState {
  final int counter;

  CounterUpdateState({required this.counter});
}
