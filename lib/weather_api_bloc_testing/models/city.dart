import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String cityName;
  final String country;

  const Location({required this.cityName, required this.country});

  factory Location.initial() => const Location(cityName: "",country: "");

  @override
  List<Object?> get props => [cityName,country];

  Location copyWith({
    String? cityName,
    String? country,
  }) {
    return Location(
      cityName: cityName ?? this.cityName,
      country: country?? this.country
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'country': country
    };
  }

  factory Location.fromJson(Map<String, dynamic> location) {
    return Location(
      cityName: location['name'],
      country: location['country'],
    );
  }
}



