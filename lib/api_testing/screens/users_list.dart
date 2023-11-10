import 'dart:async';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_glance_bloc_testing/api_testing/business_logic/user_bloc/user_bloc.dart';
import 'package:re_glance_bloc_testing/api_testing/constants/enum/processing_status.dart';
import 'package:re_glance_bloc_testing/api_testing/screens/user_details.dart';
import 'package:re_glance_bloc_testing/api_testing/widgets/single_user_grid.dart';
import 'package:re_glance_bloc_testing/api_testing/widgets/toast.dart';

import '../constants/enum/status.dart';
import '../models/user.dart';
import '../widgets/k_cool_alert.dart';
import '../widgets/user_empty_widget.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final TextEditingController textIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(RetrieveAllUsers());
    textIdController.addListener(() {
      setState(() {});
    });
  }

  void fetchUser() {
    try {
      context.read<UserBloc>().add(
            RetrieveUser(
              userId: int.parse(textIdController.text),
            ),
          );
    } catch (e) {
      toastInfo(msg: 'Error occurred $e', status: Status.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                key: const Key('text_id'),
                controller: textIdController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 3) {
                    return "User ID can not be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    CupertinoIcons.number,
                    color: Colors.grey,
                  ),
                  suffix: textIdController.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () => fetchUser(),
                          child: const Icon(
                            CupertinoIcons.search,
                            color: Colors.grey,
                          ),
                        )
                      : const SizedBox.shrink(),
                  hintText: 'Enter user id',
                  label: const Text('User ID'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {
                  if (state.status == ProcessingStatus.error) {
                    kCoolAlert(
                      message: 'Error occurred!',
                      context: context,
                      alert: CoolAlertType.error,
                    );
                  }

                  if (state.status == ProcessingStatus.success &&
                      state.user.name.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserDetails(
                          user: state.user,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return state.users.isEmpty &&
                          state.status == ProcessingStatus.error
                      ? const UserEmptyWidget()
                      : SizedBox(
                          height: MediaQuery.sizeOf(context).height / 1.26,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount:
                                context.watch<UserBloc>().state.users.length,
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
            ],
          ),
        ),
      ),
    );
  }
}
