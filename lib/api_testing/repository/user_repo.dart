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
      EasyLoading.dismiss();

      if (result.status) {
        print('Users: ${result.users}');
        return result.users;
      } else {
        toastInfo(msg: 'Error retrieving users', status: Status.error);
        throw Exception('Error retrieving users');
      }
    } catch (e) {
      toastInfo(msg: 'An error occurred: $e', status: Status.error);
      rethrow;
    }
  }

  Future<User?> retrieveUser({required int id}) async {
    try {
      EasyLoading.show();
      var result = await userServiceAPI.fetchAUser(id: id);
      EasyLoading.dismiss();

      if (result.status) {
        print('User: ${result.user}');
        return result.user;
      } else {
        toastInfo(msg: 'Error retrieving user', status: Status.error);
        throw Exception('Error retrieving user');
      }
    } catch (e) {
      toastInfo(msg: 'An error occurred: $e', status: Status.error);
      rethrow;
    }
  }
}
