import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/address.dart';

class UserAddressSection extends StatelessWidget {
  const UserAddressSection({
    super.key,
    required this.address,
  });

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            title: Text('Street: ${address.street}'),
          ),
          ListTile(
            title: Text('Suite: ${address.suite}'),
          ),
          ListTile(
            title: Text('City: ${address.city}'),
          ),
          ListTile(
            title: Text('Zipcode: ${address.zipcode}'),
          ),
          ListTile(
            title: Text('Lat:${address.geo.lat}, Lng:${address.geo.lng}'),
          ),
        ],
      ),
    );
  }
}
