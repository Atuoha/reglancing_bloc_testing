import 'package:re_glance_bloc_testing/api_testing/models/user.dart';

class UserDetailResponseEntity {
  final User user;
  final bool status;

  const UserDetailResponseEntity({
    required this.user,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'users': user,
      'status': status,
    };
  }

  factory UserDetailResponseEntity.fromJson(Map<String, dynamic> json) {
    return UserDetailResponseEntity(
      user: json['user'] as User,
      status: json['status'] as bool,
    );
  }
}
