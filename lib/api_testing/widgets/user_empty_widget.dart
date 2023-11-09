import 'package:flutter/material.dart';
import 'package:re_glance_bloc_testing/api_testing/widgets/rich_text.dart';

import '../constants/string.dart';

class UserEmptyWidget extends StatelessWidget {
  const UserEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(AppStringConstants.avatarImg),
          ),
          SizedBox(height: 10),
          RichTextWidget(title: 'Ops!', data: 'User list is empty'),
        ],
      ),
    );
  }
}
