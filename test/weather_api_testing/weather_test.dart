import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/constants/enum/processing_status.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/constants/enum/status.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/business_logic/weather_bloc/weather_bloc.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/models/location.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/models/weather.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/models/weather_response_entity.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/repository/weather_repo.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/services/weather_api.dart';
import 'package:test/test.dart';

class MockWeatherRepository extends Mock implements WeatherRepo {}

class MockWeatherBloc extends Mock implements WeatherBloc {}

class MockWeatherAPI extends Mock implements WeatherAPI {}

void main() {
  late WeatherRepo mockWeatherRepository;
  late MockWeatherAPI mockWeatherAPI;
  late WeatherBloc mockWeatherBloc;
  String city = 'Aba';

  setUp(() {
    mockWeatherAPI = MockWeatherAPI();
    mockWeatherRepository = WeatherRepo(weatherAPI: mockWeatherAPI);
    mockWeatherBloc = WeatherBloc(weatherRepo: mockWeatherRepository);
  });

  group('Weather Bloc', () {
    test('Test if the weather api is working', () async {
      when(() => mockWeatherAPI.getWeather(cityName: city)).thenAnswer(
        (invocation) async => WeatherResponseEntity(
          weather: Weather.initial(),
          status: true,
        ),
      );

      final response = await mockWeatherRepository.fetchWeather(cityName: city);
      expect(response, isA<Weather>());
    });

    blocTest(
      'Testing if weather bloc works',
      build: () {
        when(() => mockWeatherAPI.getWeather(cityName: city)).thenAnswer(
          (invocation) async => WeatherResponseEntity(
            weather: Weather.initial(),
            status: true,
          ),
        );
        return WeatherBloc(weatherRepo: mockWeatherRepository);
      },
      seed: () => WeatherState.initial(),
      act: (bloc) async {
        bloc
          ..add(SearchCityEvent(city: city))
          ..add(GetWeatherEvent());
        await bloc.stream
            .firstWhere((state) => state.status == ProcessingStatus.success);
      },
      expect: () => [
        WeatherState(
          location: Location.initial(),
          weather: Weather.initial(),
          status: ProcessingStatus.waiting,
        ),
        WeatherState(
          location: Location(cityName: city, country: ''),
          weather: Weather.initial(),
          status: ProcessingStatus.waiting,
        ),
        WeatherState(
          location: Location(cityName: city, country: ''),
          weather: Weather.initial(),
          status: ProcessingStatus.success,
        ),
      ],
    );


    blocTest(
      'Testing if weather bloc throws an error if unsuccessful',
      build: () {
        when(() => mockWeatherAPI.getWeather(cityName: city)).thenAnswer(
              (invocation) async => WeatherResponseEntity(
            weather: Weather.initial(),
            status: false,
          ),
        );
        return WeatherBloc(weatherRepo: mockWeatherRepository);
      },
      seed: () => WeatherState.initial(),
      act: (bloc) async {
        bloc
          ..add(SearchCityEvent(city: city))
          ..add(GetWeatherEvent());
        await bloc.stream
            .firstWhere((state) => state.status == ProcessingStatus.success);
      },
      expect: () => [
        Exception('An error occurred'),
        // WeatherState(
        //   location: Location.initial(),
        //   weather: Weather.initial(),
        //   status: ProcessingStatus.waiting,
        // ),
        // WeatherState(
        //   location: Location(cityName: city, country: ''),
        //   weather: Weather.initial(),
        //   status: ProcessingStatus.waiting,
        // ),
        // WeatherState(
        //   location: Location(cityName: city, country: ''),
        //   weather: Weather.initial(),
        //   status: ProcessingStatus.error,
        // ),
      ],
    );
  });
}
