import 'dart:convert';
import 'package:nepali_address/src/models/place.dart';

class Address {
  final String country;
  final List<Place> place;
  Address({
    required this.country,
    required this.place,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'place': place.map((x) => x.toMap()).toList(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      country: map['country'] ?? '',
      place: List<Place>.from(map['place']?.map((x) => Place.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  Address copyWith({
    String? country,
    List<Place>? place,
  }) {
    return Address(
      country: country ?? this.country,
      place: place ?? this.place,
    );
  }

  @override
  String toString() => 'Address(country: $country, place: $place)';
}
