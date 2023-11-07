part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final Counter counter;

  const CounterState({required this.counter});

  factory CounterState.initial() => CounterState(
        counter: Counter.initial(),
      );

  @override
  List<Object> get props => [counter];

  CounterState copyWith({
    Counter? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
