import 'package:re_glance_bloc_testing/api_testing/models/user.dart';

class UserDetailResponseEntity {
  final User users;
  final bool status;

  const UserDetailResponseEntity({
    required this.users,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'users': users,
      'status': status,
    };
  }

  factory UserDetailResponseEntity.fromJson(Map<String, dynamic> json) {
    return UserDetailResponseEntity(
      users: json['users'] as User,
      status: json['status'] as bool,
    );
  }
}
