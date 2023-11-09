import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/string.dart';
import '../models/user.dart';

class SingleUserGrid extends StatelessWidget {
  const SingleUserGrid({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey.withOpacity(0.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AppStringConstants.avatarImg),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    user.email,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    child: const Icon(
                      CupertinoIcons.phone,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.brown,
                    width: double.infinity,
                    child: const Icon(
                      CupertinoIcons.location,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    width: double.infinity,
                    child: const Icon(
                      CupertinoIcons.envelope,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
