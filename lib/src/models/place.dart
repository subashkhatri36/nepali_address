import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:nepali_address/src/models/district.dart';

class Place {
  final String province;
  final String nepali;
  final int id;
  final List<District> district;
  Place({
    required this.province,
    required this.nepali,
    required this.id,
    required this.district,
  });

  Place copyWith({
    String? province,
    String? nepali,
    int? id,
    List<District>? district,
  }) {
    return Place(
      province: province ?? this.province,
      nepali: nepali ?? this.nepali,
      id: id ?? this.id,
      district: district ?? this.district,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'province': province,
      'nepali': nepali,
      'id': id,
      'district': district.map((x) => x.toMap()).toList(),
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      province: map['province'] ?? '',
      nepali: map['nepali'] ?? '',
      id: map['id']?.toInt() ?? 0,
      district:
          List<District>.from(map['district']?.map((x) => District.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) => Place.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Place(province: $province, nepali: $nepali, id: $id, district: $district)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Place &&
        other.province == province &&
        other.nepali == nepali &&
        other.id == id &&
        listEquals(other.district, district);
  }

  @override
  int get hashCode {
    return province.hashCode ^
        nepali.hashCode ^
        id.hashCode ^
        district.hashCode;
  }
}
