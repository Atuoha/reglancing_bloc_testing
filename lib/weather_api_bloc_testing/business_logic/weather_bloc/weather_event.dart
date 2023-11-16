part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}


class SearchCityEvent extends WeatherEvent{
  final String city;
  const SearchCityEvent({required this.city});
}


class GetWeatherEvent extends WeatherEvent{

}