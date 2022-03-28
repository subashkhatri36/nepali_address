import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nepali_address/nepali_address.dart';

class Place extends BaseModel {
  final String name;
  final String nepali;
  final int id;
  final List<District> district;
  Place({
    required this.name,
    required this.nepali,
    required this.id,
    required this.district,
  }) : super('', '');

  Place copyWith({
    String? name,
    String? nepali,
    int? id,
    List<District>? district,
  }) {
    return Place(
      name: name ?? this.name,
      nepali: nepali ?? this.nepali,
      id: id ?? this.id,
      district: district ?? this.district,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nepali': nepali,
      'id': id,
      'district': district.map((x) => x.toMap()).toList(),
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      name: map['name'] ?? '',
      nepali: map['nepali'] ?? '',
      id: map['id']?.toInt() ?? 0,
      district: List<District>.from(map['district']?.map((x) => District.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) => Place.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Place(name: $name, nepali: $nepali, id: $id, district: $district)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Place && other.name == name && other.nepali == nepali && other.id == id && listEquals(other.district, district);
  }

  @override
  int get hashCode {
    return name.hashCode ^ nepali.hashCode ^ id.hashCode ^ district.hashCode;
  }
}
