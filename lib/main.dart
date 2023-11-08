import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:re_glance_bloc_testing/api_testing/business_logic/user_bloc/user_bloc.dart';
import 'package:re_glance_bloc_testing/api_testing/screens/users_list.dart';
import 'package:re_glance_bloc_testing/business_logic/counter_bloc/counter_bloc.dart';
import 'package:re_glance_bloc_testing/screens/counter_app.dart';

import 'api_testing/screens/user_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  @override
  Widget build(BuildContext context) {

    EasyLoading.instance
      ..dismissOnTap = false
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..animationDuration = const Duration(milliseconds: 50)
      ..loadingStyle = EasyLoadingStyle.light;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const CounterApp(),
        home: const UsersList(),
      ),
    );
  }
}
