import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../constants/enums/counter_status.dart';
import '../../models/counter.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CounterStarted>(_counterState);

    on<IncrementCounter>(_incrementCounter);

    on<DecrementCounter>(_decrementCounter);
  }

  void _counterState(CounterStarted event, Emitter<CounterState> emit) {
    if (state.counter.status == CounterStatus.success) return;

    emit(
      state.copyWith(
        counter: Counter(
          status: CounterStatus.success,
        ),
      ),
    );
  }

  void _incrementCounter(IncrementCounter event, Emitter<CounterState> emit) {
    var count = state.counter.counter;
    emit(
      state.copyWith(
        counter: Counter(
          counter: count + 1,
        ),
      ),
    );
  }

  void _decrementCounter(DecrementCounter event, Emitter<CounterState> emit) {
    var count = state.counter.counter;
    emit(
      state.copyWith(
        counter: Counter(
          counter: count == 0 ? 0 : count - 1,
        ),
      ),
    );
  }
}
