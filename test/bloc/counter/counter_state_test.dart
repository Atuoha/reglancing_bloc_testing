import 'package:flutter_test/flutter_test.dart';
import 'package:re_glance_bloc_testing/business_logic/counter_bloc/counter_bloc.dart';
import 'package:re_glance_bloc_testing/constants/enums/counter_status.dart';
import 'package:re_glance_bloc_testing/models/counter.dart';

void main() {
  group('Counter State', () {
    int mockCounter = Counter().counter;

    group('Counter State Initial', () {
      var mockStatus = CounterStatus.initial;

      CounterState createSubject() {
        return CounterState(
          counter: Counter(
            counter: mockCounter,
            status: mockStatus,
          ),
        );
      }

      test('test that values are the same', () {
        expect(createSubject(), equals(createSubject()));
      });

      test('test that the props are the same', () {
        expect(createSubject().props, equals(<Object?>[Counter()]));
      });
    });
  });
}
