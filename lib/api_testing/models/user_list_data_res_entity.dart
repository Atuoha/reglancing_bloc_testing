import 'package:re_glance_bloc_testing/api_testing/models/user.dart';

class UserListDataResponseEntity {
  final List<User> users;
  final bool status;

  const UserListDataResponseEntity({
    required this.users,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'users': users,
      'status': status,
    };
  }

  factory UserListDataResponseEntity.fromJson(
      List<dynamic> jsonList) {
    final List<User> users =
        jsonList.map((userJson) => User.fromJson(userJson)).toList();

    return UserListDataResponseEntity(
      users: users,
      status: users.isNotEmpty,
    );
  }
}
