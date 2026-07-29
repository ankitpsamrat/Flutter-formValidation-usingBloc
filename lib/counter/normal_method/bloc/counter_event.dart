part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterIncreaseEvent extends CounterEvent {}

class CounterDecreaseEvent extends CounterEvent {}
