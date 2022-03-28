import 'dart:convert';

import 'package:nepali_address/nepali_address.dart';

class Address extends BaseModel {
  @override
  final String name;
  final List<Place> place;
  Address({
    required this.name,
    required this.place,
  }) : super('', '');

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'place': place.map((x) => x.toMap()).toList(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      name: map['name'] ?? '',
      place: List<Place>.from(map['place']?.map((x) => Place.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source));

  Address copyWith({
    String? name,
    List<Place>? place,
  }) {
    return Address(
      name: name ?? this.name,
      place: place ?? this.place,
    );
  }

  @override
  String toString() => 'Address(name: $name, place: $place)';
}
