import 'package:equatable/equatable.dart';

class Geo extends Equatable {
  final String lat;
  final String lng;

  const Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.initial() => const Geo(lat: "000", lng: "000");

  @override
  List<Object?> get props => [lat, lng];

  @override
  String toString() {
    return 'Geo{lat: $lat, lng: $lng}';
  }

  Geo copyWith({
    String? lat,
    String? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );
  }
}
