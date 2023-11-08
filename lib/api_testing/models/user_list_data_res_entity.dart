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

  factory UserListDataResponseEntity.fromJson(Map<String, dynamic> json) {
    return UserListDataResponseEntity(
      users: json['users'] as List<User>,
      status: json['status'] as bool,
    );
  }
}
