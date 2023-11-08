import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re_glance_bloc_testing/api_testing/models/user.dart';

import '../constants/string.dart';
import '../widgets/rich_text.dart';

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
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(AppStringConstants.imgUrl),
              ),
              const SizedBox(height: 10),
              RichTextWidget(title: 'Full name', data: user.name),
              const SizedBox(height: 10),
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
              Card(
                child: ExpansionTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.4),
                    child: const Icon(
                      CupertinoIcons.location,
                      color: Colors.grey,
                    ),
                  ),
                  title: const Text('Address'),
                  children: <Widget>[
                    ListTile(
                      title: Text('Street: ${user.address.street}'),
                    ),
                    ListTile(
                      title: Text('Suite: ${user.address.suite}'),
                    ),
                    ListTile(
                      title: Text('City: ${user.address.city}'),
                    ),
                    ListTile(
                      title: Text('Zipcode: ${user.address.zipcode}'),
                    ),
                    ListTile(
                      title: Text(
                          'Lat:${user.address.geo.lat}, Lng:${user.address.geo.lng}'),
                    ),
                  ],
                ),
              ),
              Card(
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
                      title: Text('Name: ${user.company.name}'),
                    ),
                    ListTile(
                      title: Text('Catch Phrase: ${user.company.catchPhrase}'),
                    ),
                    ListTile(
                      title: Text('BS: ${user.company.bs}'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
