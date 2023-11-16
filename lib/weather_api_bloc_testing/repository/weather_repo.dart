import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/models/weather.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/services/weather_api.dart';
import '../models/city.dart';
import '../widgets/toast.dart';
import '../constants/enum/status.dart';

class WeatherRepo {
  final WeatherAPI weatherAPI;

  WeatherRepo({required this.weatherAPI});

  // search for city
  Future<City?> searchCity({required String cityName}) async {
    EasyLoading.show();
    try {
      var response = await weatherAPI.searchCity(cityName: cityName);

      if (response.status) {
        EasyLoading.dismiss();
        return response.city;
      } else {
        EasyLoading.dismiss();
        toastInfo(msg: 'Error retrieving user', status: Status.error);
        throw Exception('An error occurred');
      }
    } catch (e) {
      EasyLoading.dismiss();
      toastInfo(msg: 'Error retrieving user', status: Status.error);
      rethrow;
    }
  }

  // fetch weather
  Future<Weather?> fetchWeather({required String cityName}) async {
    EasyLoading.show();
    try {
      var response = await weatherAPI.getWeather(cityName: cityName);

      if (response.status) {
        EasyLoading.dismiss();
        return response.weather;
      } else {
        EasyLoading.dismiss();
        toastInfo(msg: 'Error retrieving user', status: Status.error);
        throw Exception('An error occurred');
      }
    } catch (e) {
      toastInfo(msg: 'Error retrieving user', status: Status.error);
      EasyLoading.dismiss();
      rethrow;
    }
  }
}
