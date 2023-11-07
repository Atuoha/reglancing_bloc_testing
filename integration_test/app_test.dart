import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:re_glance_bloc_testing/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('All Integration Texts', () {
    testWidgets('Test that the app is incrementing and decrementing', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyApp());
      await tester.pump();

      expect(find.text('Counter App'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
      await tester.tap(find.byKey(const Key('increment-button')));
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);


      await tester.tap(find.byKey(const Key('decrement-button')));
      await tester.pumpAndSettle();

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });
  });
}
