part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final Location location;
  final Weather weather;
  final ProcessingStatus status;

  const WeatherState({
    required this.location,
    required this.weather,
    required this.status,
  });

  factory WeatherState.initial() => WeatherState(
        location: Location.initial(),
        weather: Weather.initial(),
        status: ProcessingStatus.initial,
      );

  @override
  List<Object> get props => [location, weather, status];

  WeatherState copyWith({
    Location? location,
    Weather? weather,
    ProcessingStatus? status,
  }) {
    return WeatherState(
      location: location ?? this.location,
      weather: weather ?? this.weather,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'WeatherState{location: $location, weather: $weather, status: $status}';
  }
}
