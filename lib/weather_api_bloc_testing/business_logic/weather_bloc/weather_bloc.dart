import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../constants/enum/processing_status.dart';
import '../../models/city.dart';
import '../../models/weather.dart';
import '../../repository/weather_repo.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;

  WeatherBloc({required this.weatherRepo}) : super(WeatherState.initial()) {
    on<WeatherEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SearchCityEvent>(searchCity);
    on<GetWeatherEvent>(getWeather);
  }

  // searchCity
  Future<void> searchCity(
    SearchCityEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(status: ProcessingStatus.waiting));
    final String cityName = event.city;

    emit(
      state.copyWith(
        location: Location(
          cityName: cityName,
          country: '',
        ),
      ),
    );
  }

  // get weather
  Future<void> getWeather(
    GetWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(status: ProcessingStatus.waiting));
    final String cityName = state.location.cityName;
    print('CITY: $cityName');
    try {
      final response = await weatherRepo.fetchWeather(cityName: cityName);
      emit(
        state.copyWith(
          weather: response,
          status: ProcessingStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProcessingStatus.error,
        ),
      );
    }
  }
}
