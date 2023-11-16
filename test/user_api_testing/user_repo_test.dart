import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mocktail/mocktail.dart';
import 'package:re_glance_bloc_testing/api_testing/api/user_api.dart';
import 'package:re_glance_bloc_testing/api_testing/models/user.dart';
import 'package:re_glance_bloc_testing/api_testing/models/user_detail_res_entity.dart';
import 'package:re_glance_bloc_testing/api_testing/models/user_list_data_res_entity.dart';
import 'package:re_glance_bloc_testing/api_testing/repository/user_repo.dart';
import 'package:re_glance_bloc_testing/main.dart';

class MockUserServiceAPI extends Mock implements UserServiceAPI {}

class MockEasyLoading extends Mock implements EasyLoading {}

class MockToastInfo extends Mock implements Fluttertoast {}

void main() {
  group('Test User Repository', () {
    late UserRepository userRepository;
    late MockUserServiceAPI mockUserServiceAPI;

    late MockEasyLoading mockEasyLoading = MockEasyLoading();
    late MockToastInfo mockToastInfo = MockToastInfo();

    setUp(() {
      mockUserServiceAPI = MockUserServiceAPI();
      userRepository = UserRepository(userServiceAPI: mockUserServiceAPI);

      mockEasyLoading = MockEasyLoading();
      mockToastInfo = MockToastInfo();
    });

    group('Test the API', () {
      test('Test UserRepository fetch Users', () async {
        // Set up the mock response for fetchAllUsers
        when(() => mockUserServiceAPI.fetchAllUsers()).thenAnswer(
          (_) async => UserListDataResponseEntity(
            status: true,
            users: [User.initial()],
          ),
        );

        final users = await userRepository.retrieveUsers();
        expect(users, isA<List<User>>());
      });

      test('Test UserRepository fetch User', () async {
        // set up the mock for fetch user
        when(() => mockUserServiceAPI.fetchAUser(id: 1)).thenAnswer(
          (_) async => UserDetailResponseEntity(
            user: User.initial(),
            status: true,
          ),
        );

        final user = await userRepository.retrieveUser(id: 1);
        expect(user, isA<User>());
      });
    });
  });

  // group('Test the Widgets', () {
  //   // test the search user
  //   testWidgets('Test the user screen', (
  //     WidgetTester widgetTester,
  //   ) async {
  //     // pump the widget MyApp()
  //     await widgetTester.pumpWidget(
  //       const MyApp(),
  //     );
  //     // settle for the animation and stuff to settle
  //     await widgetTester.pumpAndSettle();
  //     // expect to find a user list screen
  //     expect(find.text('Registered Users'), findsNothing);
  //     // TODO
  //   });
  //
  //   // test the search user
  //   testWidgets('Test the search user fnc', (
  //     WidgetTester widgetTester,
  //   ) async {
  //     // pump the widget MyApp()
  //     await widgetTester.pumpWidget(
  //       const MyApp(),
  //     );
  //     // settle for the animation and stuff to settle
  //     await widgetTester.pumpAndSettle();
  //     // expect to find a user list screen
  //     expect(find.text('Registered Users'), findsNothing);
  //     String id = '1'; // id
  //     // enter value on the text field for searching user
  //     await widgetTester.enterText(
  //       find.byKey(const Key('text_id')),
  //       id,
  //     );
  //     // tap on the suffix icon on the search box
  //     await widgetTester.tap(
  //       find.byKey(
  //         const Key('user_search_btn'),
  //       ),
  //     );
  //     await widgetTester.pumpAndSettle();
  //     expect(find.text('Registered Users'), findsNothing);
  //     expect(find.text('Full name'), findsOneWidget);
  //   });
  // });
}
