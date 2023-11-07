import 'package:equatable/equatable.dart';
import 'package:re_glance_bloc_testing/constants/enums/counter_status.dart';

class Counter extends Equatable {
  int counter;
  CounterStatus status;

  Counter({
    this.counter = 0,
    this.status = CounterStatus.initial,
  });

  factory Counter.initial() => Counter(
        counter: 0,
        status: CounterStatus.initial,
      );

  @override
  List<Object?> get props => [counter, status];

  Counter copyWith({
    int? counter,
    CounterStatus? status,
  }) {
    return Counter(
      counter: counter ?? this.counter,
      status: status ?? this.status,
    );
  }
}
