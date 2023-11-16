import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:re_glance_bloc_testing/api_testing/api/user_api.dart';
import 'package:re_glance_bloc_testing/api_testing/widgets/toast.dart';

import '../constants/enum/status.dart';
import '../models/user.dart';

class UserRepository {
  final UserServiceAPI userServiceAPI;

  UserRepository({required this.userServiceAPI});

  // retrieve users
  Future<List<User>?> retrieveUsers() async {
    try {
      EasyLoading.show(); // comment during testing
      var result = await userServiceAPI.fetchAllUsers();

      if (result.status) {
        EasyLoading.dismiss();  // comment during testing
        if (kDebugMode) {
          print('Users: ${result.users}');
        }
        return result.users;
      } else {
        toastInfo(msg: 'Error retrieving users', status: Status.error);  // comment during testing
        throw Exception('Error retrieving users');
      }
    } catch (e) {
      EasyLoading.dismiss();  // comment during testing
      toastInfo(
        msg: 'Ops! An error occurred! Check your internet connection',   // comment during testing
        status: Status.error,
      );
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      rethrow;
    }
  }

  // retrieve user
  Future<User?> retrieveUser({required int id}) async {
    try {
      EasyLoading.show();   // comment during testing
      var result = await userServiceAPI.fetchAUser(id: id);

      if (result.status) {
        EasyLoading.dismiss();   // comment during testing
        if (kDebugMode) {
          print('User: ${result.user}');
        }
        return result.user;
      } else {
        toastInfo(msg: 'Error retrieving user', status: Status.error);  // comment during testing
        throw Exception('Error retrieving user');
      }
    } catch (e) {
      EasyLoading.dismiss();  // comment during testing
      toastInfo(
        msg: 'Ops! An error occurred! It\'s either '
            'the user id is invalid or network glitch',    // comment during testing
        status: Status.error,
      );
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      rethrow;
    }
  }
}
