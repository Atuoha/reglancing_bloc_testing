import 'package:flutter/foundation.dart';
import '../utilities/http_util.dart';
import '../models/weather_response_entity.dart';

class WeatherAPI {
  final String weatherAPI = '9a8ae9ea24a956f91cfcf6001fbd623e';


  Future<WeatherResponseEntity> getWeather({required String cityName}) async {
    var response = await HttpUtil().get(
      '/forecast?q=$cityName&appid=$weatherAPI',
    );
    if (kDebugMode) {
      print(response.toString());
    }
    return WeatherResponseEntity.fromJson(response);
  }
}
