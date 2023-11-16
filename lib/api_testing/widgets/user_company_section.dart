import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/company.dart';


class UserCompanySection extends StatelessWidget {
  const UserCompanySection({
    super.key,
    required this.company,
  });

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.4),
          child: const Icon(
            CupertinoIcons.building_2_fill,
            color: Colors.grey,
          ),
        ),
        title: const Text('Company'),
        children: <Widget>[
          ListTile(
            title: Text('Name: ${company.name}'),
          ),
          ListTile(
            title: Text('Catch Phrase: ${company.catchPhrase}'),
          ),
          ListTile(
            title: Text('BS: ${company.bs}'),
          ),
        ],
      ),
    );
  }
}
