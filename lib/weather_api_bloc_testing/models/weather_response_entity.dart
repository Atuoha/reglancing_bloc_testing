import 'package:re_glance_bloc_testing/weather_api_bloc_testing/models/weather.dart';


class WeatherResponseEntity {
  final Weather weather;
  final bool status;

  const WeatherResponseEntity({
    required this.weather,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'weather': weather,
      'status': status,
    };
  }

  factory WeatherResponseEntity.fromJson(Map<String, dynamic> json) {
    return WeatherResponseEntity(
      weather: Weather.fromJson(json),
      status: json['status'] as bool,
    );
  }
}
