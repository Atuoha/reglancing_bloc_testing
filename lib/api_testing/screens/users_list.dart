import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re_glance_bloc_testing/api_testing/screens/user_details.dart';

import '../constants/string.dart';
import '../models/user.dart';
import '../widgets/rich_text.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: GridView.count(
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 2,
          //   mainAxisExtent: 10,
          //   crossAxisSpacing: 10,
          // ),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(
            50,
            (index) => GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UserDetails(
                    user: User.initial(),
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.grey.withOpacity(0.4),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage(AppStringConstants.imgUrl),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'John Doe',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'johndoe@gmail.com',
                              style: TextStyle(
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
