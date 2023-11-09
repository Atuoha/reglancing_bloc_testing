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
    if (json.isNotEmpty) {
      final User user = User.fromJson(json);
      return UserDetailResponseEntity(
        user: user,
        status: true, // Set status to true because user data is present
      );
    } else {
      return UserDetailResponseEntity(
        user: User.initial(), // Provide a default user object or handle it as needed
        status: false, // Set status to false because there is no user data
      );
    }
  }
}
