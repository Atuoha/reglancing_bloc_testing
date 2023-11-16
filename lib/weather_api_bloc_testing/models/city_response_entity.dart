import 'city.dart';

class CityResponseEntity {
  final City city;
  final bool status;

  const CityResponseEntity({
    required this.city,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'status': status,
    };
  }

  factory CityResponseEntity.fromJson(Map<String, dynamic> json) {
    return CityResponseEntity(
      city: City.fromJson(json),
      status: json['status'] as bool,
    );
  }
}
