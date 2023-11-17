import 'package:equatable/equatable.dart';

import 'city.dart';

class Weather extends Equatable {
  final Location location;
  final String weather;
  final String description;
  final String icon;

  const Weather({
    required this.location,
    required this.weather,
    required this.description,
    required this.icon,
  });

  factory Weather.initial() => Weather(
        location: Location.initial(),
        weather: "",
        description: "",
        icon: "",
      );

  @override
  List<Object?> get props => [
        location,
        weather,
        description,
        icon,
      ];

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: Location.fromJson(json['city']),
      weather: json['list'][0]['weather'][0]['main'],
      description: json['list'][0]['weather'][0]['description'],
      icon: json['list'][0]['weather'][0]['icon'],
    );
  }
}
