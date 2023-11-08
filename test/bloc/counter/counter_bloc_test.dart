import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:re_glance_bloc_testing/business_logic/counter_bloc/counter_bloc.dart';
import 'package:re_glance_bloc_testing/constants/enums/counter_status.dart';
import 'package:re_glance_bloc_testing/models/counter.dart';

void main() {
  group('Counter Bloc', () {
    int mockCounter = Counter().counter;

    CounterBloc buildBloc() {
      return CounterBloc();
    }

    group('Test that CounterBloc is working perfectly', () {
      blocTest(
        'Test CounterStarted and emitted success status',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(CounterStarted()),
        expect: () => [
          CounterState(
            counter: Counter(
              counter: mockCounter,
              status: CounterStatus.success,
            ),
          ),
        ],
      );

      blocTest(
        'Test CounterStarted and if it emits success status',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(CounterStarted()),
        expect: () => [
          CounterState(
            counter: Counter(
              counter: mockCounter,
              status: CounterStatus.success,
            ),
          ),
        ],
      );

      blocTest(
        'Test CounterStarted and if it increments counter and emits a state',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(IncrementCounter()),
        expect: () => [
          CounterState(
            counter: Counter(
              counter: mockCounter + 1,
            ),
          ),
        ],
      );

      blocTest(
        'Test CounterIncrement and if it increments counter and emits a state',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(IncrementCounter()),
        expect: () => [
          CounterState(
            counter: Counter(
              counter: mockCounter + 1,
            ),
          ),
        ],
      );


      blocTest(
        'Test CounterIncrement and if it increments counter and emits a state when clicked twice',
        build: () => CounterBloc(),
        act: (bloc) => bloc
          ..add(IncrementCounter())
          ..add(IncrementCounter()),
        expect: () => [
          CounterState(
            counter: Counter(
              counter: mockCounter + 1,
            ),
          ),

          CounterState(
            counter: Counter(
              counter: mockCounter + 2,
            ),
          ),
        ],
      );

      blocTest(
        'Test CounterDecrement and if it decrements counter '
        'and emits a state when value is above 0 and stays the same when the value is 0',
        // seed: () => CounterState(counter: Counter(counter: mockCounter)),
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(DecrementCounter()),
        expect: () => [
          CounterState(
            counter: Counter(
              counter: mockCounter == 0 ? mockCounter : mockCounter - 1,
            ),
          ),
        ],
      );
    });
  });
}
