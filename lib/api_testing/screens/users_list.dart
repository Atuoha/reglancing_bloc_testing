import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_glance_bloc_testing/api_testing/business_logic/user_bloc/user_bloc.dart';
import 'package:re_glance_bloc_testing/api_testing/constants/enum/processing_status.dart';
import 'package:re_glance_bloc_testing/api_testing/screens/user_details.dart';
import 'package:re_glance_bloc_testing/api_testing/widgets/single_user_grid.dart';

import '../models/user.dart';
import '../widgets/k_cool_alert.dart';
import '../widgets/user_empty_widget.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(RetrieveAllUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state.status == ProcessingStatus.error) {
              kCoolAlert(
                message: 'Error occurred!',
                context: context,
                alert: CoolAlertType.error,
              );
            }
          },
          builder: (context, state) {
            return state.users.isEmpty
                ? const UserEmptyWidget()
                : SizedBox(
                    height: MediaQuery.sizeOf(context).height / 1,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: context.watch<UserBloc>().state.users.length,
                      itemBuilder: (context, index) {
                        User user =
                            context.watch<UserBloc>().state.users[index];
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserDetails(
                                user: user,
                              ),
                            ),
                          ),
                          child: SingleUserGrid(user: user),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
