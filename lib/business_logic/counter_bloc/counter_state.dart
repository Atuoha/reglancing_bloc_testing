part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int value;
  const CounterState({required this.value});

  factory CounterState.initial()=>const CounterState(value: 0);

  @override
  List<Object> get props => [value];

  CounterState copyWith({
    int? value,
  }) {
    return CounterState(
      value: value ?? this.value,
    );
  }
}

