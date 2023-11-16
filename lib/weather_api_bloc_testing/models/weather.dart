import 'package:equatable/equatable.dart';

import 'city.dart';

class Weather extends Equatable {
  final City cityName;
  final String celsius;
  final String fahrenheit;

  const Weather({
    required this.cityName,
    required this.celsius,
    required this.fahrenheit,
  });

  factory Weather.initial() => Weather(
        cityName: City.initial(),
        celsius: "",
        fahrenheit: "",
      );

  @override
  List<Object?> get props => [cityName, celsius, fahrenheit];

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'celsius': celsius,
      'fahrenheit': fahrenheit,
    };
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: City.fromJson(json['city']),
      celsius: json['celsius'] as String,
      fahrenheit: json['fahrenheit'] as String,
    );
  }
}
