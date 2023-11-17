import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/business_logic/weather_bloc/weather_bloc.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/constants/constants.dart';

import '../models/weather.dart';
import '../widgets/k_cached_image.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Weather weather = context.read<WeatherBloc>().state.weather;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KCachedImage(
              image: '${AppConstants.weatherImgURL}/${weather.icon}@2x.png',
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: '${weather.location.cityName}, ',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
                children: [
                  TextSpan(
                    text: weather.location.country,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              weather.weather,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 10),
            Text(
              weather.description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
