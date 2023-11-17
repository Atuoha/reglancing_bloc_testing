import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/models/weather.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/services/weather_api.dart';
import '../models/location.dart';
import '../widgets/toast.dart';
import '../constants/enum/status.dart';

class WeatherRepo {
  final WeatherAPI weatherAPI;

  WeatherRepo({required this.weatherAPI});

  // fetch weather
  Future<Weather?> fetchWeather({required String cityName}) async {
    EasyLoading.show();
    try {
      var response = await weatherAPI.getWeather(cityName: cityName);

      if (response.status) {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print('weather: ${response.weather}');
        }
        return response.weather;
      } else {
        EasyLoading.dismiss();
        toastInfo(msg: 'Ops! Error retrieving weather', status: Status.error);
        throw Exception('An error occurred');
      }
    } catch (e) {
      if (kDebugMode) {
        print('error ${e.toString()}');
      }
      toastInfo(msg: 'Ops! Error retrieving weather', status: Status.error);
      EasyLoading.dismiss();
      rethrow;
    }
  }
}
