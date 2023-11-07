import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<IncrementCounter>((event, emit) {
      emit(state.copyWith(value: state.value + 1));
    });

    on<DecrementCounter>((event, emit) {
      emit(state.copyWith(value: state.value == 0 ? 0 : state.value - 1));
    });
  }
}
