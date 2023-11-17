// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:re_glance_bloc_testing/firebase_auth-testing/services/auth.dart';
// import 'package:test/test.dart';
//
// class MockUser extends Mock implements User {}
//
// final MockUser _mockUser = MockUser();
//
// class MockFirebaseAuth extends Mock implements FirebaseAuth {
//   Stream<User?> authChanges() {
//     return Stream.fromIterable([_mockUser]);
//   }
// }
//
// void main() {
//   late MockFirebaseAuth mockFirebaseAuth;
//   late Auth auth;
//
//   setUp(() {
//     mockFirebaseAuth = MockFirebaseAuth();
//     auth = Auth(auth: mockFirebaseAuth);
//   });
//
//   group('Firebase Auth', () {
//     test('Test for user changes', () async {
//       expectLater(auth.user, emitsInOrder([_mockUser]));
//     });
//
//     test('Create account', () async {
//       String email = 'demo@gmail.com';
//       String password = '00000000';
//
//       when(
//         () => mockFirebaseAuth.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         ),
//       ).thenAnswer(
//         (invocation) async => Future.value(null),
//       );
//
//       final response = await auth.createAccount(
//         email: email,
//         password: password,
//       );
//       expect(response, 'Success');
//     });
//
//     test('Create account exception', () async {
//       String email = 'demo@gmail.com';
//       String password = '00000000';
//
//       when(
//         () => mockFirebaseAuth.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         ),
//       ).thenAnswer(
//         (invocation) async => throw FirebaseAuthException(
//             code: '1', message: 'Ops! Something went wrong'),
//       );
//
//       final response = await auth.createAccount(
//         email: email,
//         password: password,
//       );
//       expect(response, 'Ops! Something went wrong');
//     });
//
//     test('Sign In', () async {
//       String email = 'demo@gmail.com';
//       String password = '00000000';
//
//       when(
//         () => mockFirebaseAuth.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         ),
//       ).thenAnswer(
//         (invocation) async => Future.value(null),
//       );
//
//       final response = await auth.signIn(
//         email: email,
//         password: password,
//       );
//       expect(response, 'Success');
//     });
//
//     test('Sign In exception', () async {
//       String email = 'demo@gmail.com';
//       String password = '00000000';
//
//       when(
//         () => mockFirebaseAuth.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         ),
//       ).thenAnswer(
//         (invocation) async => throw FirebaseAuthException(
//             code: '1', message: 'Ops! Something went wrong'),
//       );
//
//       final response = await auth.signIn(
//         email: email,
//         password: password,
//       );
//       expect(response, 'Ops! Something went wrong');
//     });
//
//     test('Sign Out', () async {
//       when(
//         () => mockFirebaseAuth.signOut(),
//       ).thenAnswer(
//         (invocation) async => Future.value(null),
//       );
//
//       final response = await auth.signOut();
//       expect(response, 'Success');
//     });
//
//     test('Sign Out exception', () async {
//       when(
//         () => mockFirebaseAuth.signOut(),
//       ).thenAnswer(
//         (invocation) async => throw FirebaseAuthException(
//             code: '1', message: 'Ops! Something went wrong'),
//       );
//
//       final response = await auth.signOut();
//       expect(response, 'Ops! Something went wrong');
//     });
//   });
// }
