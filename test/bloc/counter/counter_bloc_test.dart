import 'package:flutter_test/flutter_test.dart';
import 'package:re_glance_bloc_testing/business_logic/counter_bloc/counter_bloc.dart';

void main() {
  group('Bloc events', () {
    group('CounterStarted', () {
      test('test that counterstarted is the same', () async {
        expect(CounterStarted(), CounterStarted());
      });

      test('test that props is empty', () async {
        expect(CounterStarted().props, equals(<Object?>[]));
      });
    });

    group('CounterIncrement', () {
      test('test for equality',
          () => {expect(IncrementCounter(), equals(IncrementCounter()))});
    });

    group('CounterDecrement', () {
      test('test for equality',
          () => {expect(IncrementCounter(), equals(IncrementCounter()))});
    });
  });
}
