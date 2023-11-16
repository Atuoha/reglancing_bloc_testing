import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re_glance_bloc_testing/api_testing/models/user.dart';

import '../constants/string.dart';
import '../models/address.dart';
import '../models/company.dart';
import '../widgets/primary_user_detail_section.dart';
import '../widgets/rich_text.dart';
import '../widgets/user_address_section.dart';
import '../widgets/user_company_section.dart';
import '../widgets/user_profile_image_section.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserProfileImage(
                userImg: AppStringConstants.avatarImg,
                userId: user.id.toString(),
              ),
              const SizedBox(height: 10),
              RichTextWidget(
                title: 'Full name',
                data: user.name,
              ),
              const SizedBox(height: 10),
              PrimaryUserSection(user: user),
              UserAddressSection(address: user.address),
              UserCompanySection(company: user.company),
            ],
          ),
        ),
      ),
    );
  }
}
