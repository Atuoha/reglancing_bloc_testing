import 'package:flutter/foundation.dart';

import '../models/user_detail_res_entity.dart';
import '../models/user_list_data_res_entity.dart';
import '../utils/http_util.dart';

class UserServiceAPI {
  static Future<UserListDataResponseEntity> fetchAllUsers() async {
    var response = await HttpUtil().get('users');
    if (kDebugMode) {
      print(response.toString());
    }
    return UserListDataResponseEntity.fromJson(response);
  }

  static Future<UserDetailResponseEntity> fetchAUser({required int id}) async {
    var response = await HttpUtil().get('users/$id');
    if (kDebugMode) {
      print(response.toString());
    }
    return UserDetailResponseEntity.fromJson(response);
  }
}
