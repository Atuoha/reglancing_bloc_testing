import 'package:flutter/foundation.dart';
import '../../api_testing/utils/http_util.dart';
import '../models/city_response_entity.dart';
import '../models/weather_response_entity.dart';

class WeatherAPI {

  Future<CityResponseEntity> searchCity({required String cityName}) async {
    var response = await HttpUtil().get('users');
    if (kDebugMode) {
      print(response.toString());
    }
    return CityResponseEntity.fromJson(response);
  }

  Future<WeatherResponseEntity> getWeather({required String cityName}) async {
    var response = await HttpUtil().get('users/$cityName');
    if (kDebugMode) {
      print(response.toString());
    }
    return WeatherResponseEntity.fromJson(response);
  }
}
