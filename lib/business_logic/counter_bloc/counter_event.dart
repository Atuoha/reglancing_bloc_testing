part of 'counter_bloc.dart';

class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}


class CounterStarted extends CounterEvent {}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}
