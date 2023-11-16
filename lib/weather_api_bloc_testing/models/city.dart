import 'package:equatable/equatable.dart';

class City extends Equatable {
  final String cityName;

  const City({required this.cityName});

  factory City.initial() => const City(cityName: "");

  @override
  List<Object?> get props => [cityName];

  City copyWith({
    String? cityName,
  }) {
    return City(
      cityName: cityName ?? this.cityName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
    };
  }

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityName: json['cityName'] as String,
    );
  }
}



