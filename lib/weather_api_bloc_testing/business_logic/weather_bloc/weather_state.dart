part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final City city;
  final Weather weather;
  final ProcessingStatus status;

  const WeatherState({
    required this.city,
    required this.weather,
    required this.status
  });

  factory WeatherState.initial() => WeatherState(
        city: City.initial(),
        weather: Weather.initial(),
    status: ProcessingStatus.initial
      );

  @override
  List<Object> get props => [city, weather,status];

  WeatherState copyWith({
    City? city,
    Weather? weather,
    ProcessingStatus? status,
  }) {
    return WeatherState(
      city: city ?? this.city,
      weather: weather ?? this.weather,
      status:status?? this.status,
    );
  }

  @override
  String toString() {
    return 'WeatherState{cityName: $city, weather: $weather, status: $status}';
  }
}
