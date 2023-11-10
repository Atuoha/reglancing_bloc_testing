import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:re_glance_bloc_testing/api_testing/api/user_api.dart';
import 'package:re_glance_bloc_testing/api_testing/widgets/toast.dart';

import '../constants/enum/status.dart';
import '../models/user.dart';

class UserRepository {
  final UserServiceAPI userServiceAPI;

  UserRepository({required this.userServiceAPI});

  Future<List<User>?> retrieveUsers() async {
    try {
      EasyLoading.show();
      var result = await userServiceAPI.fetchAllUsers();

      if (result.status) {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print('Users: ${result.users}');
        }
        return result.users;
      } else {
        toastInfo(msg: 'Error retrieving users', status: Status.error);
        throw Exception('Error retrieving users');
      }
    } catch (e) {
      EasyLoading.dismiss();
      toastInfo(
          msg: 'Ops! An error occurred! Check your internet connection',
          status: Status.error);
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      rethrow;
    }
  }

  Future<User?> retrieveUser({required int id}) async {
    try {
      EasyLoading.show();
      var result = await userServiceAPI.fetchAUser(id: id);

      if (result.status) {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print('User: ${result.user}');
        }
        return result.user;
      } else {
        toastInfo(msg: 'Error retrieving user', status: Status.error);
        throw Exception('Error retrieving user');
      }
    } catch (e) {
      EasyLoading.dismiss();
      toastInfo(
        msg: 'Ops! An error occurred! It\'s either '
            'the user id is invalid or network glitch',
        status: Status.error,
      );
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      rethrow;
    }
  }
}
