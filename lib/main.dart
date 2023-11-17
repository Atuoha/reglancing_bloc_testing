import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:re_glance_bloc_testing/api_testing/api/user_api.dart';
import 'package:re_glance_bloc_testing/api_testing/business_logic/user_bloc/user_bloc.dart';
import 'package:re_glance_bloc_testing/api_testing/repository/user_repo.dart';
import 'package:re_glance_bloc_testing/api_testing/screens/users_list.dart';
import 'package:re_glance_bloc_testing/business_logic/counter_bloc/counter_bloc.dart';
import 'package:re_glance_bloc_testing/screens/counter_app.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/business_logic/weather_bloc/weather_bloc.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/repository/weather_repo.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/screens/search_screen.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/services/weather_api.dart';

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

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(userServiceAPI: UserServiceAPI()),
        ),
        RepositoryProvider(
          create: (context) => WeatherRepo(weatherAPI: WeatherAPI()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => WeatherBloc(
              weatherRepo: context.read<WeatherRepo>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: const CounterApp(),
          // home: const UsersList(), // user list api
          home: const WeatherSearchScreen(),
          // weather app api
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
