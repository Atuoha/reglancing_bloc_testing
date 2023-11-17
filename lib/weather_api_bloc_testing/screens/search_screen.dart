import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/enum/processing_status.dart';
import 'weather_details.dart';
import '../widgets/k_cool_alert.dart';
import '../business_logic/weather_bloc/weather_bloc.dart';
import '../constants/enum/status.dart';
import '../widgets/toast.dart';

class WeatherSearchScreen extends StatefulWidget {
  const WeatherSearchScreen({super.key});

  @override
  State<WeatherSearchScreen> createState() => _WeatherSearchScreenState();
}

class _WeatherSearchScreenState extends State<WeatherSearchScreen> {
  final TextEditingController cityTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cityTextController.addListener(() {
      setState(() {});
    });
  }

  void fetchWeather() async {
    try {
      // submit city

      // get weather
      context.read<WeatherBloc>().add(GetWeatherEvent());
    } catch (e) {
      toastInfo(msg: 'Error occurred $e', status: Status.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App [Testing]'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state.status == ProcessingStatus.error) {
                kCoolAlert(
                  message: 'An error occurred',
                  context: context,
                  alert: CoolAlertType.error,
                );
              } else if (state.status == ProcessingStatus.success) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WeatherDetails(),
                  ),
                );
              }
            },
            builder: (context, state) {
              return TextFormField(
                keyboardType: TextInputType.text,
                key: const Key('city_name_text-field'),
                controller: cityTextController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 3) {
                    return "City can not be empty";
                  }
                  return null;
                },
                onChanged: (value) {
                  context.read<WeatherBloc>().add(
                        SearchCityEvent(
                          city: value,
                        ),
                      );
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    CupertinoIcons.building_2_fill,
                    color: Colors.grey,
                  ),
                  suffix: cityTextController.text.isNotEmpty
                      ? GestureDetector(
                          key: const Key('city_search_btn'),
                          onTap: () => fetchWeather(),
                          child: const Icon(
                            CupertinoIcons.search,
                            color: Colors.grey,
                          ),
                        )
                      : const SizedBox.shrink(),
                  hintText: 'Enter city name',
                  label: const Text('City Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
