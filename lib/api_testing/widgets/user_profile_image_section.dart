import 'package:flutter/material.dart';


class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
    required this.userImg,
    required this.userId,
  });

  final String userId;
  final String userImg;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: userId,
      child: CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage(userImg),
      ),
    );
  }
}
