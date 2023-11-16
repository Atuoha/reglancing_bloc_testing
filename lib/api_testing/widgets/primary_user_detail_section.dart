import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class PrimaryUserSection extends StatelessWidget {
  const PrimaryUserSection({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              child: const Icon(
                CupertinoIcons.envelope,
                color: Colors.grey,
              ),
            ),
            title: Text(user.email),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              child: const Icon(
                CupertinoIcons.person,
                color: Colors.grey,
              ),
            ),
            title: Text(user.username),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              child: const Icon(
                CupertinoIcons.phone,
                color: Colors.grey,
              ),
            ),
            title: Text(user.username),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              child: const Icon(
                CupertinoIcons.globe,
                color: Colors.grey,
              ),
            ),
            title: Text(user.website),
          ),
        ),
      ],
    );
  }
}
